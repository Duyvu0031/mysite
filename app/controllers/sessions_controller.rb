class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
    unless User.exists?(email_address: "duy0031@gmail.com")
      begin
        User.create!(email_address: "duy0031@gmail.com", password: "duy0031")
      rescue ActiveRecord::RecordInvalid => e
        logger.error "Failed to create admin user: #{e.message}"
      end
    end
  end

  def create
    if user = User.authenticate_by(email_address: params[:email_address], password: params[:password])
      start_new_session_for user
      redirect_to after_authentication_url
    else
      redirect_to new_session_path, alert: "Try another email address or password."
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path
  end
end
  
  
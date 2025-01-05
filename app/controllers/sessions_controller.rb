class SessionsController < ApplicationController
  def create
    user = User.find_by(email_address: params[:email_address])
    if user && user.authenticate(params[:password])
      # Đăng nhập thành công, lưu session
      session[:user_id] = user.id  # Lưu user_id vào session
      redirect_to root_path # Điều hướng về trang chủ hoặc trang sau khi đăng nhập
    else
      flash[:alert] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def after_authentication_url
    products_path  # Hoặc trang bạn muốn điều hướng đến sau khi đăng nhập thành công
  end
end

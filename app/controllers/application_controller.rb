class ApplicationController < ActionController::Base
  def allow_unauthenticated_access(options = {})
    # Cho phép truy cập không cần đăng nhập cho các action được chỉ định
    skip_before_action :authenticate_user!, only: options[:only]
  end
  helper_method :authenticated?

  before_action :authenticate_user!, except: %i[new create]

  # Phương thức cho phép truy cập không cần đăng nhập
  def allow_unauthenticated_access(options = {})
    skip_before_action :authenticate_user!, only: options[:only]
  end

  def authenticated?
    session[:user_id].present?
  end

  def authenticate_user!
    unless session[:user_id]
      redirect_to login_path, alert: "Bạn cần phải đăng nhập trước khi truy cập trang này."
    end
  end
end

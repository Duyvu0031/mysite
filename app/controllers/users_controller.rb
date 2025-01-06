class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path, notice: "Tài khoản đã được tạo thành công. Vui lòng đăng nhập."
    else
      logger.debug @user.errors.full_messages.inspect
      flash.now[:alert] = "Đã xảy ra lỗi khi tạo tài khoản của bạn."
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end
end

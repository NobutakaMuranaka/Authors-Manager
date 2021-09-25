class SessionsController < ApplicationController
  def new
  end

  def create
    user = AdminUser.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to admin_user_url(current_admin_user.id)
    else
      flash.now[:danger] = 'メールアドレスとパスワードの組み合わせが誤っています'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to "/login"
  end
end

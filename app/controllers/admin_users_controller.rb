class AdminUsersController < ApplicationController
  
  def index
  end
  
  def new
    @admin_user = AdminUser.new 
  end

  def show
    @admin_user = AdminUser.find(params[:id])
  end
  
  def create
    @admin_user = AdminUser.new(admin_user_params)
    if @admin_user.save
      flash[:success] = "登録が完了しました"
      redirect_to @admin_user
    else
      render 'new'
    end
  end

  private

    def admin_user_params
      params.require(:admin_user).permit(:email, :password,
                                   :password_confirmation)
    end

end

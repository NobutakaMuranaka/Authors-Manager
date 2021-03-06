class AdminUsersController < ApplicationController
  before_action :logged_in_admin_user, only: [:index, :new, :show, :edit, :update]
  before_action :correct_admin_user,   only: [:edit, :update]
  
  def index
    @admin_users = AdminUser.all
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

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(admin_user_params_update)
      flash[:success] = "プロフィールが更新されました！"
      redirect_to @admin_user
    else
      render 'edit'
    end
  end

  private

  # ユーザー新規作成時に許可する属性
  def admin_user_params
    params.require(:admin_user).permit(:name, :email, :password,
                                   :password_confirmation)
  end

  # プロフィール編集時に許可する属性
  def admin_user_params_update
    params.require(:admin_user_params).permit(:name, :email)
  end
  
  # 正しいユーザーかどうか確認
  def correct_admin_user
    @admin_user = AdminUser.find(params[:id])
    if !current_admin_user?(@admin_user)
      flash[:danger] = "このページへはアクセスできません"
      redirect_to(root_url)
    end
  end
  
end

module SessionsHelper
  def log_in(admin_user)
    session[:admin_user_id] = admin_user.id
  end

  def current_admin_user
    if session[:admin_user_id]
      @current_admin_user ||= AdminUser.find_by(id: session[:admin_user_id])
    end
  end

  def logged_in?
    !current_admin_user.nil?
  end

  def log_out
    session.delete(:admin_user_id)
    @current_admin_user = nils
  end
  
  # 渡されたユーザーがログイン済みユーザーであればtrueを返す
  def current_admin_user?(admin_user)
    admin_user == current_admin_user
  end
end

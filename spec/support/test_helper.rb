include ApplicationHelper # full_titleメソッドの読み込み

def is_logged_in?
  !session[:admin_user_id].nil?
end
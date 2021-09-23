module ApplicationHelper
  def full_title(page_title = '')  # full_titleメソッドを定義
    base_title = 'Authors-Manager'
    if page_title.blank?
      base_title  # トップページはタイトル「Authors-Managaer」
    end
  end
end

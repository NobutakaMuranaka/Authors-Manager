require "rails_helper"

RSpec.describe "ログイン", type: :request do
  let!(:admin_user) { create(:admin_user) }

  it "正常なレスポンスを返すこと" do
    get login_path
    expect(response).to be_success
    expect(response).to have_http_status "200"
  end
  
  it "有効なユーザーでログイン＆ログアウト" do
    get login_path
    post login_path, params: { session: { email: admin_user.email,
                                          password: admin_user.password } }
    redirect_to admin_user
    follow_redirect!
    expect(response).to render_template('admin_users/show')
    expect(is_logged_in?).to be_truthy
    delete logout_path
    expect(is_logged_in?).not_to be_truthy
    redirect_to root_url
  end

  it "無効なユーザーでログイン" do
    get login_path
    post login_path, params: { session: { email: "xxx@example.com",
                                         password: admin_user.password } }
    expect(is_logged_in?).not_to be_truthy
  end
  
end
require "rails_helper"
RSpec.describe "ユーザー登録", type: :request do
  before do
    get signup_path
  end

  it "正常なレスポンスを返すこと" do
    expect(response).to be_success
    expect(response).to have_http_status "200"
  end
  
  it "有効なユーザーで登録" do
    expect {
      post admin_users_path, params: { admin_user: { email: "user@example.com",
                                               password: "password",
                                               password_confirmation: "password" } }
    }.to change(AdminUser, :count).by(1)
    redirect_to @admin_user
    follow_redirect!
    expect(response).to render_template('admin_users/show')
  end

  it "無効なユーザーで登録" do
    expect {
      post admin_users_path, params: { admin_user: { email: "user@example.com",
                                               password: "password",
                                               password_confirmation: "pass" } }
    }.not_to change(AdminUser, :count)
  end
end
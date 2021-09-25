require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe "ユーザー登録ページ" do
    before do
      visit signup_path
    end

    context "ページレイアウト" do
      it "「ユーザー登録」の文字列が存在することを確認" do
        expect(page).to have_content 'ユーザー登録'
      end

      it "正しいタイトルが表示されることを確認" do
        expect(page).to have_title full_title('ユーザー登録')
      end
    end
    
    context "ユーザー登録処理" do
      it "有効なユーザーでユーザー登録を行うとユーザー登録成功のフラッシュが表示されること" do
        fill_in "admin_user[email]", with: "user@example.com"
        fill_in "admin_user[password]", with: "password"
        fill_in "admin_user[password_confirmation]", with: "password"
        click_button "登録する"
        expect(page).to have_content "登録が完了しました"
      end
    end
    
  end
end
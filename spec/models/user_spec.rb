require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  let(:admin_user) { create(:admin_user) }

  context "バリデーション" do
    it "メールアドレスがあれば有効な状態であること" do
      expect(admin_user).to be_valid
    end

    it "メールアドレスがなければ無効な状態であること" do
      user = build(:admin_user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "メールアドレスが255文字以内であること" do
      user = build(:admin_user, email: "#{"a" * 244}@example.com")
      user.valid?
      expect(user.errors[:email]).to include("は255文字以内で入力してください")
    end

    it "重複したメールアドレスなら無効な状態であること" do
      other_user = build(:admin_user, email: admin_user.email)
      other_user.valid?
      expect(other_user.errors[:email]).to include("はすでに存在します")
    end

    it "メールアドレスは小文字で保存されること" do
      email = "ExamPle@example.com"
      user = create(:admin_user, email: email)
      expect(user.email).to eq email.downcase
    end

    it "パスワードがなければ無効な状態であること" do
      user = build(:admin_user, password: nil, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "パスワードが6文字以上であること" do
      user = build(:admin_user, password: "a" * 6, password_confirmation: "a" * 6)
      user.valid?
      expect(user).to be_valid
    end
  end
end
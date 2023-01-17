require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "abc00000", password_confirmation: "abc00000",first_name: "山田", second_name: "太郎", first_name_kana: "ヤマダ", second_name_kana: "タロウ", birthday: "1111" )
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空および同一アドレスは登録できない" do
      user = User.new(nickname: "abc", email: "", password: "abc00000", password_confirmation: "abc00000",first_name: "山田", second_name: "太郎", first_name_kana: "ヤマダ", second_name_kana: "タロウ", birthday: "1111" )
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空および6文字以上の半角英数字を両方含まないと登録できない" do
      user = User.new(nickname: "abc", email: "kkk@gmail.com", password: "", password_confirmation: "",first_name: "山田", second_name: "太郎", first_name_kana: "ヤマダ", second_name_kana: "タロウ", birthday: "1111" )
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank", "Password is invalid" )
    end
    it "first_nameが空および漢字以外は登録できない" do
      user = User.new(nickname: "abc", email: "kkk@gmail.com", password: "abc0000", password_confirmation: "abc0000",first_name: "", second_name: "太郎", first_name_kana: "ヤマダ", second_name_kana: "タロウ", birthday: "1111" )
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank", "First name is invalid" )
    end
    it "second_nameが空および漢字以外は登録できない" do
      user = User.new(nickname: "abc", email: "kkk@gmail.com", password: "abc0000", password_confirmation: "abc0000",first_name: "山田", second_name: "", first_name_kana: "ヤマダ", second_name_kana: "タロウ", birthday: "1111" )
      user.valid?
      expect(user.errors.full_messages).to include("Second name can't be blank", "Second name is invalid" )
    end
    it "first_name_kanaが空およびカタカナ以外は登録できない" do
      user = User.new(nickname: "abc", email: "kkk@gmail.com", password: "abc0000", password_confirmation: "abc0000",first_name: "山田", second_name: "太郎", first_name_kana: "", second_name_kana: "タロウ", birthday: "1111" )
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid" )
    end
    it "second_name_kanaが空およびカタカナ以外は登録できない" do
      user = User.new(nickname: "abc", email: "kkk@gmail.com", password: "abc0000", password_confirmation: "abc0000",first_name: "山田", second_name: "太郎", first_name_kana: "ヤマダ", second_name_kana: "", birthday: "1111" )
      user.valid?
      expect(user.errors.full_messages).to include("Second name kana can't be blank", "Second name kana is invalid" )
    end
    it "birthdayが空だと登録できない" do
      user = User.new(nickname: "abc", email: "kkk@gmail.com", password: "abc0000", password_confirmation: "abc0000",first_name: "山田", second_name: "太郎", first_name_kana: "ヤマダ", second_name_kana: "タロウ", birthday: "" )
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end  
  end
end
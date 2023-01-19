require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "ユーザー登録ができるとき" do
     it "nickname、email、password、password_confirmation、first_name、second_name、first_name_kana、second_name_kana、birthdayが存在すれば登録できる" do
      expect(@user).to be_valid
     end
    end

    context "ユーザー登録できないとき" do
     it "nicknameが空では登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
    
     it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it "emailが重複していると登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it "emailに@を含まない場合は登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end

     it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include("Password can't be blank" )
     end
     it "passwordが6文字未満では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank" )
     end
     it "passwordが英字のみでは登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "passwordが数字のみでは登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "passwordに全角文字が含まれていると登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank" )
     end

     it "password_confirmationが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank" )
     end

     it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
     end
     it "first_nameに半角文字が含まれていると登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
     end

     it "second_nameが空では登録できない" do
      @user.second_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name can't be blank" )
     end
     it "second_nameに半角文字が含まれていると登録できない" do
      @user.second_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name can't be blank" )
     end

     it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank" )
     end
     it "first_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank" )
     end

     it "second_name_kanaが空では登録できない" do
      @user.second_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name kana can't be blank" )
     end
     it "second_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.second_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name kana can't be blank")
     end

     it "birthdayが空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
    end   
  end
end
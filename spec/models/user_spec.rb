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

     it "emailが重複していなければ登録できる" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      expect(@user).to be_valid
     end

     it "emailに@が含まれていれば登録できる" do
      @user.email = "test@test.com"
      expect(@user).to be_valid
     end

     it "passwordが6文字以上であれば登録できる" do
      @user.password = "test1234"
      expect(@user).to be_valid
     end

     it "passwordが半角英数字混合であれば登録できる" do
      @user.password = "test1234"
      expect(@user).to be_valid
     end

     it "passwordとpassword_confirmationが一致していれば登録できる" do
      @user.password = @user.password_confirmation
      expect(@user).to be_valid
     end

     it "first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
      @user.first_name = "山田"
      expect(@user).to be_valid
     end

     it "second_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
      @user.second_name = "太郎"
      expect(@user).to be_valid
     end

     it "first_name_kanaが全角（カタカナ）であれば登録できる" do
      @user.first_name_kana = "ヤマダ"
      expect(@user).to be_valid
     end

     it "second_name_kanaが全角（カタカナ）であれば登録できる" do
      @user.second_name_kana = "タロウ"
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
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

     it "emailに@を含まない場合は登録できない" do
      @user.email = "testtest.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
     end

     it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end

     it "passwordが6文字未満では登録できない" do
      @user.password = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end

     it "passwordが英字のみでは登録できない" do
      @user.password = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
     end

     it "passwordが数字のみでは登録できない" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
     end

     it "passwordに全角文字が含まれていると登録できない" do
      @user.password = "テストテスト"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
     end

     it "passwordとpassword_confirmationが一致していないと登録できない" do
      @user.password = "test1234"
      @user.password_confirmation = "test12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end

     it "password_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end

     it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
     end

     it "first_nameに半角文字が含まれていると登録できない" do
      @user.first_name = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
     end

     it "second_nameが空では登録できない" do
      @user.second_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name can't be blank" )
     end

     it "second_nameに半角文字が含まれていると登録できない" do
      @user.second_name = "taro"
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name is invalid" )
     end

     it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank" )
     end

     it "first_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.first_name_kana = "やまだ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
     end

     it "second_name_kanaが空では登録できない" do
      @user.second_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name kana can't be blank" )
     end

     it "second_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.second_name_kana = "たろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name kana is invalid")
     end

     it "birthdayが空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end

    end   
  end
end
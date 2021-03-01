require 'rails_helper'
RSpec.describe User, type: :model do
 describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end
     it "全ての情報が正しく入力されており、ユーザーの登録ができること" do
        expect(@user).to be_valid
     end
     it 'nameが空だと登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
     end
     it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it 'paawordが5文字以下では登録できない' do
      @user.password = '111aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end
     it 'passwordが半角英語飲みは登録できない' do
      @user.password = 'abcdefghi'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it 'passwordが数字のみは登録できない' do
      @user.password = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it 'passwordが全角英数字混合は登録できない' do
      @user.password = '１２３４５abc'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it 'passwordとpassword_confirmationが一致しないと登録できない'do
      @user.password = '123456q'
      @user.password_confirmation = '123456q'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 6 characters)")
    end
    it 'emailがかぶっていた場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken") end
    it 'emailの@がない場合は登録できない' do
      @user.email = '111111example.com'
      @user.valid? 
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it '誕生日が空の場合は登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it '姓が空の場合登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it '姓：全角（漢字・ひらがな・カタカナ）以外は登録できない' do
      @user.last_name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it '名が空の場合は登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it '姓：全角（漢字・ひらがな・カタカナ）以外は登録できない' do
      @user.first_name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it '姓（フリガナ）：空の場合は登録できない' do
      @user.last_name_jp = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name jp can't be blank")
    end
    it '全角（カタカナ）以外は登録できない' do
      @user.last_name_jp = '悟空'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name jp is invalid")
    end
    it '名（フリガナ）：空の場合は登録できない' do
      @user.first_name_jp = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name jp can't be blank")
    end
    it '全角（カタカナ）以外は登録できない' do
      @user.first_name_jp = '悟空'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name jp is invalid")
    end
  end
end
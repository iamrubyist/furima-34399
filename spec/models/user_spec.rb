require 'rails_helper'
RSpec.describe User, type: :model do
 describe "ユーザー新規登録" do
  before do
      @user = FactoryBot.build(:user)
  end
     it 'nameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(user.errors.full_messages).to include("Name can't be blank")
     end
     it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
     end
     it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
     end
     it 'paawordが5文字以下では登録できない' do
      @user.password = '111aa'
      @user.valid?
      expect(user.errors.full_messages).to include("5文字以下では登録できません")
     end
     it 'passwordが半角英語飲みは登録できない' do
      @user.password = 'abcdefghi'
      @user.valid?
      expect(user.errors.full_messages).to include("半角英語のみでは登録できません")
     end
     it 'passwordが数字のみは登録できない' do
      @user.password = '1234567'
      @user.valid?
      expect(user.errors.full_messages).to include("数字のみはと黒くできません")
     end
     it 'passwordが全角英数字混合は登録できない' do
      @user.password = '１２３４５abc'
      @user.valid?
      expect(user.errors.full_messages).to include("全角英数字混合は登録できない")
     end
     it 'passwordとpassword_confirmationが一致しないと登録できない'do
      @user.password = '123456q'
      @user.password_confirmation = '123456q'
      @user.valid?
      expect(user.errors.full_messages).to include("passwordが一致していません")
    end
    it 'emailがかぶっていた場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user,email: @user.email)
      another_user.valid?
      expect(user.errors.full_messages).to include("Emailすでに登録されています") end
    it 'emailの@がない場合は登録できない' do
      @user.email = '111111example.com'
      @user.valid? 
      expect(user.errors.full_messages).to include("正しいメールアドレスを入力してください")
    end
    it '誕生日が空の場合は登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(user.errors.full_messages).to include("Birhday can't be blank")
    end
    it '姓が空の場合登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(user.errors.full_messages).to include("LastName can't be blank")
    end
    it '姓：全角（漢字・ひらがな・カタカナ）以外は登録できない' do
      @user.last_name = '123'
      @user.valid?
      expect(user.errors.full_messages).to include("全角（漢字・ひらがな・カタカナ）以外は登録できません")
    end
    it '名が空の場合は登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(user.errors.full_messages).to include("FirstName can't be blank")
    end
    it '姓：全角（漢字・ひらがな・カタカナ）以外は登録できない' do
      @user.first_name = '123'
      @user.valid?
      expect(user.errors.full_messages).to include("全角（漢字・ひらがな・カタカナ）以外は登録できません")
  end
  it '姓（フリガナ）：空の場合は登録できない' do
    @user.last_name_jp = ''
    @user.valid?
    expect(user.errors.full_messages).to include("LastNameJP can't be blank")
  end
  it '全角（カタカナ）以外は登録できない' do
    @user.last_name_jp = '悟空'
    @user.valid?
    expect(user.errors.full_messages).to include("全角（カタカナ）以外は登録できません")
  end
  it '名（フリガナ）：空の場合は登録できない' do
    @user.first_name_jp = ''
    @user.valid?
    expect(user.errors.full_messages).to include("FirstNameJP can't be blank")
  end
  it '全角（カタカナ）以外は登録できない' do
    @user.firt_name_jp = '悟空'
    @user.valid?
    expect(user.errors.full_messages).to include("全角（カタカナ）以外は登録できません")
end
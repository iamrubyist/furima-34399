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
   end
end
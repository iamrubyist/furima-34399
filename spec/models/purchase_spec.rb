require 'rails_helper'
RSpec.describe PurchaseForm, type: :model do
  describe "商品購入機能" do
    before do
      @user = FactoryBot.create(:user, email: 'sample@sample')
      @market = FactoryBot.create(:market)
      @purchase = FactoryBot.build(:purchase_form)
      @purchase.user_id = @user.id
      @purchase.market_id = @market.id
      sleep(1)
    end
    context 'ログイン状態の出品者以外のユーザーのみ、必要な情報を適切に入力すると、商品の購入ができること' do
      it "ログイン状態の出品者以外のユーザーのみ、必要な情報を適切に入力すると、商品の購入ができること" do
        expect(@purchase).to be_valid
      end
      it "priceとtokenがあれば保存ができること" do
        expect(@purchase).to be_valid
      end
      it "建物名が抜けていても登録できること" do
        expect(@purchase).to be_valid
      end
    end

    

    context 'ログイン状態の出品者以外のユーザーのみ、必要な情報を適切に入力すると、商品の購入ができないこと' do
      it "郵便番号が空では登録できない" do
        @purchase.postal_code_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it "都道府県が空では登録できない" do
        @purchase.prefectures = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefectures can't be blank")
      end
      it "地区町村が空では登録できない" do
        @purchase.municipality = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Municipality can't be blank")
      end
      it "番地が空では登録できない" do
        @purchase.address = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空では登録できない" do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号は11桁以内の数値のみ保存可能なこと（09012345678となる）" do
        @purchase.phone_number = '090111122223333'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "電話番号はハイフン無し(10-11桁)の数字のみ保存可能なこと" do
        @purchase.phone_number = '090111122223333'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "郵便番号の保存にはハイフンが必要であること（123-4567となる)" do
        @purchase.postal_code_id = '1112222'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code is invalid")
      end
      it "tokenが空では登録できないこと" do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it "(---)以外でないと登録できないこと" do
        @purchase.prefectures = "0"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include( "Prefectures must be other than 0")
      end
      it "英数混合では登録できないこと" do
        @purchase.phone_number = "080abcd1234"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is not a number")
      end
      it "market_idが空では登録できないこと" do
        @purchase.market_id = " "
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Market can't be blank")
      end
      it "user_idが空では登録できないこと" do
        @purchase.user_id = " "
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
require 'rails_helper'
RSpec.describe PurchaseForm, type: :model do
  describe "商品購入機能" do
    before do
      @market = FactoryBot.build(:buy_market)
    end
    context 'ログイン状態の出品者以外のユーザーのみ、必要な情報を適切に入力すると、商品の購入ができること' do
      it "ログイン状態の出品者以外のユーザーのみ、必要な情報を適切に入力すると、商品の購入ができること" do
        expect(@purchase).to be_valid
    end
    

    context 'ログイン状態の出品者以外のユーザーのみ、必要な情報を適切に入力すると、商品の購入ができないこと' do
      it "郵便番号が空では登録できない" do
        @purchase.postal_code_id = ''
        @purchase.valid?
        expect(@market.errors.full_messages).to include("Postal_code_id can't be blank")
      end
      it "都道府県が空では登録できない" do
        @purchase.prefectures = ''
        @purchase.valid?
        expect(@market.errors.full_messages).to include("Prefectures can't be blank")
      end
      it "地区町村が空では登録できない" do
        @purchase.municipality = ''
        @purchase.valid?
        expect(@market.errors.full_messages).to include("Municipality can't be blank")
      end
      it "番地が空では登録できない" do
        @purchase.address = ''
        @purchase.valid?
        expect(@market.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空では登録できない" do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@market.errors.full_messages).to include("Phone_number can't be blank")
      end

      #郵便番号の保存にはハイフンが必要であること（123-4567となる）
      #電話番号は11桁以内の数値のみ保存可能なこと（09012345678となる）
    end
  end
end
require 'rails_helper'
RSpec.describe Market, type: :model do
  describe "商品出品機能" do
    before do
      @market = FactoryBot.build(:market)
    end
    context 'ユーザ新規登録ができる時' do
      it "全ての情報が正しく入力されており、商品出品ができること" do
        expect(@market).to be_valid
      end
    end

    context 'ユーザ新規登録ができない時' do
    it "商品出品が空では保存できない" do
      @market.name = ''
      @market.valid?
      expect(@market.errors.full_messages).to include("Name can't be blank")
    end
    it "商品の説明が空ではできない" do
      @market.item_text = ''
      @market.valid?
      expect(@market.errors.full_messages).to include("Item text can't be blank")
    end
    it "カテゴリーが空では登録できない" do
      @market.category_id = ''
      @market.valid?
      expect(@market.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end
    it '商品の状態が空では登録できない' do
      @market.item_status_id = ''
      @market.valid?
      expect(@market.errors.full_messages).to include("Item status can't be blank", "Item status is not a number")
    end
    it '配送料の負担が空では登録できない' do
      @market.delivery_id = ''
      @market.valid?
      expect(@market.errors.full_messages).to include("Delivery can't be blank", "Delivery is not a number")
    end
    it '発送元の地域が空では登録できない' do
      @market.area_id = ''
      @market.valid?
      expect(@market.errors.full_messages).to include("Area can't be blank", "Area is not a number")
    end
    it '発送までの日時が空では登録できない' do
      @market.days_to_ship_id = ''
      @market.valid?
      expect(@market.errors.full_messages).to include("Days to ship can't be blank", "Days to ship is not a number")
    end
    it '販売価格が空では登録できない' do
      @market.price = ''
      @market.valid?
      expect(@market.errors.full_messages).to include("Price can't be blank")
    end
    it '商品価格が299円以下では出品できない' do
      @market.price = '299'
      @market.valid?
      expect(@market.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it '商品価格が10_000_000円以上では出品できない' do
      @market.price = '10_000_000'
      @market.valid?
      expect(@market.errors.full_messages).to include("Price must be an integer")
    end
    it '商品画像が空では出品できない' do
      @market.image = nil
      @market.valid?
      expect(@market.errors.full_messages).to include("Image can't be blank")
    end
    it '商品価格が半角英数字混合では出品できない' do
      @market.price = '1000abc'
      @market.valid?
      expect(@market.errors.full_messages).to include("Price is not a number", "Price is not a number")
    end
    it '商品価格が半角英字のみでは出品できない' do
      @market.price = 'abcdefg'
      @market.valid?
      expect(@market.errors.full_messages).to include("Price is not a number", "Price is not a number")
    end
    it '商品価格が全角文字では出品できない' do
      @market.price = 'あいうえお'
      @market.valid?
      expect(@market.errors.full_messages).to include("Price is not a number", "Price is not a number")
    end
    it 'category_idが0の場合出品できない' do
      @market.category_id = '0'
      @market.valid?
      expect(@market.errors.full_messages).to include("Category must be other than 0")
    end
    it 'item_status_idが0の場合出品できない' do
      @market.item_status_id = '0'
      @market.valid?
      expect(@market.errors.full_messages).to include("Item status must be other than 0")
    end
    it 'delivery_idが0の場合出品できない' do
      @market.delivery_id = '0'
      @market.valid?
      expect(@market.errors.full_messages).to include("Delivery must be other than 0")
    end
    it 'area_idが0の場合出品できない' do
      @market.area_id = '0'
      @market.valid?
      expect(@market.errors.full_messages).to include("Area must be other than 0")
    end
    it 'days_to_ship_idが0の場合出品できない' do
      @market.days_to_ship_id = '0'
      @market.valid?
      expect(@market.errors.full_messages).to include("Days to ship must be other than 0")
    end
    end
 end
end
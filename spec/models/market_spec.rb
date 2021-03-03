require 'rails_helper'
RSpec.describe Market, type: :model do
  describe "商品出品機能" do
    before do
      @market = FactoryBot.build(:market)
    end
    it "全ての情報が正しく入力されており、商品出品ができること" do
      expect(@market).to be_valid
    end
    it "商品出品が空では保存できない" do
      @market.name = ''
      @market.valid?
      expect(@market.errors.full_messages).to include("Name can't be blank")
    end
    it "商品の説明が空ではできない" do
      @market.item_text = ''
      @market.valid?
      expect(@market.errors.full_messages).to include("Item text can't be blank", "User can't be blank", "User must exist")
    end
    it "カテゴリーが空では登録できない" do
      @market.category_id = ''
      @market.valid?
      expect(@market.errors.full_messages).to include("Category can't be blank", "Category is not a number", "User can't be blank", "User must exist")
    end
    it '商品の状態が空では登録できない' do
      @market.item_status_id = ''
      @market.valid?
      expect(@market.errors.full_messages).to include("Item status can't be blank", "User can't be blank", "User must exist")
    end
    it '配送料の負担が空では登録できない' do
      @market.delivery_id = ''
      @market.valid?
      expect(@market.errors.full_messages).to include("Delivery can't be blank", "User can't be blank", "User must exist")
    end
    it '発送元の地域が空では登録できない' do
      @market.area_id = ''
      @market.valid?
      expect(@market.errors.full_messages).to include("Area can't be blank", "User can't be blank", "User must exist")
    end
    it '発送までの日時が空では登録できない' do
      @market.days_to_ship_id = ''
      @market.valid?
      expect(@market.errors.full_messages).to include("Days to ship can't be blank", "User can't be blank", "User must exist")
    end
    it '販売価格が空では登録できない' do
      @market.price = ''
      @market.valid?
      expect(@market.errors.full_messages).to include("Price can't be blank")
    end
 end
end
require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品登録" do
    context  '商品出品登録ができない時' do
    it "商品名が空だと登録できない" do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it "商品の説明がないと登録できない" do
      @item.item_text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item text can't be blank")
    end
    it "カテゴリー情報がないと登録できない" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it "商品の状態の情報が空だと登録できない" do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it "配送料の負担の情報が空だと登録できない" do
      @item.shopping_charge_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it "発送元の情報が空だと登録できない" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it "発送までの日数の情報が空だと登録できない" do
      @item.days_for_send_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it "価格情報が空だと登録できない" do
      @item.price = nil
      @item.valid?numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格は¥0〜¥300の間だと登録できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it "価格が¥10,000,000以上だと登録できない" do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it "商品の画像がないと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end
end
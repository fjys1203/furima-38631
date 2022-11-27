require 'rails_helper'

RSpec.describe OrderForm, type: :model do
before do
  @order = FactoryBot.build(:order_form)
  @order.user_id = FactoryBot.create(:user)
  @order.item_id = FactoryBot.create(:item)
  @order_form = FactoryBot.build(:order_form, user_id: @order.user_id, item_id: @order.item_id)
  sleep(1)
end

describe '配送先情報の保存' do
  context '配送先情報の保存ができるとき' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order).to be_valid
    end
    it '建物名が空でも保存できる' do
      @order.building = nil
      expect(@order).to be_valid
    end
  end

  context '配送先情報の保存ができないとき' do
    it 'user_idが空だと保存できない' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと保存できない' do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
    it '郵便番号が空だと保存できないこと' do
      @order.postcode = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postcode can't be blank")
    end
    it '郵便番号にハイフンがないと保存できないこと' do
      @order.postcode = 1_234_567
      @order.valid?
      expect(@order.errors.full_messages).to include("Postcode is invalid")
    end
    it '都道府県が「---」だと保存できないこと' do
      @order.prefecture_id = 0
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it '都道府県が空だと保存できないこと' do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が空だと保存できないこと' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @order.block = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Block can't be blank")
    end
    it '電話番号が空だと保存できないこと' do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号にハイフンがあると保存できないこと' do
      @order.phone_number = '123 - 1234 - 1234'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号が12桁以上あると保存できないこと' do
      @order.phone_number = 12_345_678_910_123_111
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号が9桁以下だと保存できないこと' do
      @order.phone_number = 345_678_910
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is invalid')
    end
    it 'トークンが空だと保存できないこと' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
end

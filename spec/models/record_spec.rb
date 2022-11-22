require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record =FactoryBot.build(:@record)
  end

  context '内容に問題ない場合' do
    it "priceがあれば保存できること" do
      expect(@record).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "priceが空では保存できない" do
      @reccord.price = nil
      @record.valid?
      expect(@record.errors.full_messages).to include("Price can't be blank")
    end
  end
end

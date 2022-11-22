require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.build(:record)
  end

 describe '配送先情報の保存' do
  context '内容に問題ない場合' do
    it "入力情報が正しければ保存できる" do
      expect(@record).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenが空では保存できない" do
      @reccord.token = nil
      @record.valid?
      expect(@record.errors.full_messages).to include("Token can't be blank")
    end
  end
end
end
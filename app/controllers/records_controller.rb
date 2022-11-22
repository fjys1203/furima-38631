class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]

  def index
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @order.valid?
      pay_item
      @record.save
      return redirect_to root_path
    else 
      render index
    end
  end


  private

  def record_params
    params.require(:record).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def non_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.record.present?
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: record_params[:price], 
        card: record_params[:token],   
        currency: 'jpy'            
      )
  end

end

class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    unless @item.user_id == current_user.id && @item.order.nil?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
       redirect_to item_path
    else
      render 'edit'
    end
  end

  def show
    if @item.order.present?
      redirect_to root_path
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


   private

  def item_params
      params.require(:item).permit(:image,:item_name,:item_text,:category_id,:condition_id,:shopping_charge_id,:prefecture_id,:days_for_send_id,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end

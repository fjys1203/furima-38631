class ItemsController < ApplicationController

  def index
    @items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_prams)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

    private

    def item_params
      params.require(:item).permit(:item_name,:item_text,:category_id,:condition_id,:shopping_charge_id,:prefecture_id,:days_for_send_id,:price)
    end
  end
  
end

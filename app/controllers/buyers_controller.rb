class BuyersController < ApplicationController
  def index
    @buyer_shopping_address = BuyerShoppingAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buyer_shopping_address = BuyerShoppingAddress.new(shopping_address_params)
      if @buyer_shopping_address.valid?
        @buyer_shopping_address.save
        redirect_to controller: :items, action: :index
      else
        render action: :index
      end
  end

  private

  def shopping_address_params
    params.require(:buyer_shopping_address).permit(:postal_code, :prefecture, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

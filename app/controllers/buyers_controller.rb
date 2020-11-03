class BuyersController < ApplicationController
  before_action :set_item

  def index
    @buyer_shopping_address = BuyerShoppingAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buyer_shopping_address = BuyerShoppingAddress.new(shopping_address_params)
    if @buyer_shopping_address.valid?
      pay_item
      @buyer_shopping_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def shopping_address_params
    params.require(:buyer_shopping_address).permit(:postal_code, :prefecture, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: shopping_address_params[:token],
      currency: 'jpy'
    )
  end
end

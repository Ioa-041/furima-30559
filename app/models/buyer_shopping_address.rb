class BuyerShoppingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :prefecture
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'Input only number' }
    validates :token
  end
  validates :prefecture, numericality: { other_than: 1 }

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    ShoppingAddress.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, phone_number: phone_number, buyer_id: buyer.id)
  end
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :scheduled
  belongs_to_active_hash :shipping_fee_status
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    validates :category
    validates :prefecture
    validates :sales_status
    validates :scheduled
    validates :shipping_fee_status
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :price, format: { with: /[3-9][0-9]{2}|[1-9][0-9]{3,6}/, message: 'Half-width number' }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :prefecture_id
    validates :sales_status_id
    validates :scheduled_id
    validates :shipping_fee_status_id
  end
end

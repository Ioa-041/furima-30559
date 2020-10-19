class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :prefecture, :sales_status, :svheduled, :shipping_fee_status
  belongs_to :user
  has_one_attached :image
end

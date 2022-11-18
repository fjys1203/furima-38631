class Item < ApplicationRecord
  belongs_to :user
  has_one :record

  validation :item_name, presence: true
  validation :item_text, presence: true
  validation :category_id, presence: true
  validation :condition_id, presence: true
  validation :shopping_charge_id, presence: true
  validation :prefecture_id, presence: true
  validation :days_for_send_id, presence: true
  validation :price, presence: true
  validation :user, foreign_key: true
end

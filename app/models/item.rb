class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shopping_charge
  belongs_to :prefecture
  belongs_to :days_for_send


  belongs_to :user
  has_one :record

  
  validates :item_name, presence: true
  validates :item_text, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shopping_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :days_for_send_id, numericality: { other_than: 1 }
  validates :price, presence: true
  validates :user, foreign_key: true
end
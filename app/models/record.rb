class Record < ApplicationRecord
  attr_accessor :user, :item, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :token
  
  belongs_to :user
  belongs_to :item
  has_one :send

  validates :user, presence: true
  validates :item, presence: true
  validates :postcode, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :prefecture_id, presence: true, numericality: { other_than: 0 }
  validates :city, presence: true
  validates :block, presence: true
  validates :phone_number, presence: true, format: { with: /\A[0-9]{11}\z/}
  validates :token, presence: true

end

class Item < ApplicationRecord
  
  validates :name, presence: true
  validates :information, presence: true
  validates :item_price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :item_price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  validates :image, presence: true
  

has_one_attached :image
belongs_to :user
# has_one :buyer

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :condition
belongs_to :state
belongs_to :shipping
belongs_to :deliveryday
validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
validates :state_id, numericality: { other_than: 0 , message: "can't be blank"}
validates :shipping_id, numericality: { other_than: 1 , message: "can't be blank"}
validates :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank"}

end

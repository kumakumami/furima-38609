class Item < ApplicationRecord
  
  validates :name, presence: true
  validates :information, presence: true
  validates :item_price, presence: true


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

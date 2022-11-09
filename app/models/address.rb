class Address < ApplicationRecord
  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :state_id, numericality: { other_than: 0, message: "can't be blank" }
end

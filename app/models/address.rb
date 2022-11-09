class Address < ApplicationRecord
  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  
end

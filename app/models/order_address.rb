class OrderAddress
  include ActiveModel::Model
  attr_accessor  :user_id,:item_id, :zip,:state_id,:city,:addressline1,:addressline2,:tell,:order_id
  
  
  with_options presence: true do
    validates  :user_id
    validates  :item_id
    validates  :zip, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates  :city
    validates  :addressline1
    validates  :tell,format: {with: /\A[0-9]{11}\z/ }
    validates  :order_id
  end
  validates :state_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(zip: zip, state_id: state_id, city: city, addressline1: addressline1, addressline2: addressline2, tell:tell, order_id: order.id)
  end
end

end
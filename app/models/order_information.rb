class OrderInformation
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number,
                :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id
    validates :municipalities
    validates :address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Information.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities,
                       address: address, building_name: building_name, telephone_number: telephone_number)
  end
end

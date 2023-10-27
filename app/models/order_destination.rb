class OrderDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :cities, :street_address, :building, :telephone, :order_id, :token


  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code,       format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
    validates :prefecture_id,   numericality: { other_than: 1, message: "can't be blank" }
    validates :cities
    validates :street_address
    validates :telephone,       format: { with: /\A\d{10,11}\z/ }
    validates :token

  end
                                       


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, cities: cities, street_address: street_address, building: building, telephone: telephone, order_id: order.id)
  end

  
end
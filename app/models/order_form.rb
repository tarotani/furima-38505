class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postalcode, :first_add_id, :second_add, :address, :building, :tel, :token

  with_options presence: true do
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # shipsモデルのバリデーション
    validates :postalcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :first_add_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :second_add
    validates :address
    validates :tel, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    # トークンのバリデーション
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    # ストロングパラメーターでデータが運ばれ、それらが保存のタイミングで「order_id」が生成され、保存される。
    Ship.create(postalcode: postalcode, first_add_id: first_add_id, second_add: second_add, address: address, building: building,
       tel: tel, order_id: order.id)
  end
end

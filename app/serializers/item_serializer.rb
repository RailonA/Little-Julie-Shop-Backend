class ItemSerializer < ActiveModel::Serializer
  attributes :id, :itemPhoto, :itemName, :itemPrice, :itemDescription, :categories_id

  has_many :shoppingcarts
  has_many :users, through: :shoppingcarts
end

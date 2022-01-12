class ItemSerializer < ActiveModel::Serializer
  attributes :id, :itemPhoto, :itemName, :itemPrice, :itemDescription, :category_id

  has_many :shoppingcarts
  has_many :users, through: :shoppingcarts
end

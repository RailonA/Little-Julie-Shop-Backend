class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :itemPhoto, :itemName, :itemPrice, :itemDescription

  has_many :shoppingcarts
  has_many :users, through: :shoppingcarts
end

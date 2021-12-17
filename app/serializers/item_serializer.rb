class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :itemPhoto, :itemName, :itemPrice, :itemDescription

  # has_many :appointments
  # has_many :users, through: :appointments
end

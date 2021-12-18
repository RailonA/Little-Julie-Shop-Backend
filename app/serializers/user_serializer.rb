class UserSerializer < ActiveModel::Serializer
  attributes :id, :username

  has_many :shoppingcarts
  has_many :items, through: :shoppingcarts
end

class ShoppingcartSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :item_id
  
    belongs_to :user, class_name: 'User'
    belongs_to :item, class_name: 'Item'
  end
  
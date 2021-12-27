class Item < ApplicationRecord
  belongs_to :category, class_name: 'Category'

  has_one_attached :itemPhoto

  has_many :shoppingcarts
  has_many :users, through: :shoppingcarts

  validates_presence_of :itemName,
                        :itemPrice,
                        :itemPhoto,
                        :categories_id
end

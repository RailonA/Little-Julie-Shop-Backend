class Item < ApplicationRecord
  belongs_to :categories, foreign_key: :categories_id, class_name: 'Category'

  has_many :shoppingcarts, dependent: :destroy

  has_one_attached :itemPhoto
  has_many :shoppingcarts
  has_many :users, through: :shoppingcarts

  validates_presence_of :itemName,
                        :itemPrice,
                        :itemPhoto
end

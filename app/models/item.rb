class Item < ApplicationRecord
  belongs_to :categories, foreign_key: :categories_id, class_name: 'Category'

  has_one_attached :itemPhoto

  validates_presence_of :itemName,
                        :itemPrice,
                        :itemPhoto
end

class Item < ApplicationRecord
  belongs_to :category, foreign_key: :category_id, class_name: 'Category'

  has_one_attached :itemPhoto

  validates_presence_of :itemName,
                        :itemPrice
end

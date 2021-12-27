class Category < ApplicationRecord
  has_ancestry
  has_many :item, class_name: 'Item', foreign_key: :item_id
  has_many :children, class_name: 'Category', foreign_key: :parent_id
end

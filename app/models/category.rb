class Category < ApplicationRecord
    has_ancestry
    has_many :items, class_name: 'Items', foreign_key: :items_id
    has_many :children, class_name: "Category", foreign_key: :parent_id

end

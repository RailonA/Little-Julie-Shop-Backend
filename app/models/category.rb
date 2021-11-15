class Category < ApplicationRecord
    has_ancestry
    has_many :items, class_name: 'Items', foreign_key: :items_id

end

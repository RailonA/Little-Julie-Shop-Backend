class CategoryGroup < ApplicationRecord
    has_and_belongs_to_many :item
end

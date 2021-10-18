class Item < ApplicationRecord
  has_one_attached :itemPhoto

  validates_presence_of :itemName,
                        :itemPrice
end

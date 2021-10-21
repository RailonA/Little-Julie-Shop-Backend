require "administrate/field/base"

class ItemPhotoField < Administrate::Field::Base
  def to_s
    data
  end
end

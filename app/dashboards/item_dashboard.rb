require 'administrate/base_dashboard'

class ItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    itemPhoto: ItemPhotoField,
    categories_id: Field::Select.with_options(
      collection: Category.roots.flat_map do |parent|
        parent.children.map { |child| [child.name, child.id] }
      end
    ),
    id: Field::Number,
    itemName: Field::String,
    itemPrice: Field::String,
    itemDescription: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    itemPhoto
    categories_id
    id
    itemName
    itemPrice
  ].freeze

  # SHOW_PAGE_ATTRIBUTEITEMPHOTOS

  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    itemPhoto
    categories_id
    id
    itemName
    itemPrice
    itemDescription
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    itemPhoto
    categories_id
    itemName
    itemPrice
    itemDescription
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(item)
  #   "Item ##{item.id}"
  # end
end

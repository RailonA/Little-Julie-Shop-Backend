class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :categories, index: true, foreign_key: true
      t.string :name
      t.string :itemName
      t.string :itemPrice
      t.string :itemDescription

      t.timestamps
    end
  end
end

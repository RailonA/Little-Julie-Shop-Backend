class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :category, index: true, foreign_key: true
      t.string :itemName,  null: false
      t.string :itemPrice,  null: false
      t.string :itemDescription

      t.timestamps
    end
  end
end

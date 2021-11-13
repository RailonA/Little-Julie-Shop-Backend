class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :itemName
      t.price :itemPrice
      t.string :itemDescription

      t.timestamps
    end
  end
end

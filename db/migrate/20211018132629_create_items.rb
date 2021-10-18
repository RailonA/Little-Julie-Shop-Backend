class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :itemName
      t.string :itemPrice
      t.string :itemDescription

      t.timestamps
    end
  end
end

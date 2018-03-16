class CreateContainers < ActiveRecord::Migration[5.1]
  def change
    create_table :containers do |t|
      t.string :product_category
      t.string :address
      t.text :description
      t.string :supermarket
      t.string :picture

      t.timestamps
    end
  end
end

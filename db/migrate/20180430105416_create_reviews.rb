class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :first_name
      t.integer :rating
      t.string :content
      t.references :user, foreign_key: true
      t.references :container, foreign_key: true


      t.timestamps
    end
  end
end

class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.references :user, foreign_key: true
      t.references :container, foreign_key: true
      t.boolean :capacity

      t.timestamps
    end
  end
end

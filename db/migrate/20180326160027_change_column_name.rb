class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :containers, :picture, :photo
  end
end

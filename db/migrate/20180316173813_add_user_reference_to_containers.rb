class AddUserReferenceToContainers < ActiveRecord::Migration[5.1]
  def change
    add_reference :containers, :user, foreign_key: true
  end
end

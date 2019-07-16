class AddRoleToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :role, foreign_key: true
    remove_column :roles, :user
  end
end

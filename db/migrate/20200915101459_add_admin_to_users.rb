class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :type, :integer
    add_column :users, :admin, :integer
  end
end

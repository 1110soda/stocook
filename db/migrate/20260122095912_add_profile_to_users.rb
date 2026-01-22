class AddProfileToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :allergies, :string
    add_column :users, :appetite, :string
  end
end

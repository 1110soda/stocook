class CreateStocks < ActiveRecord::Migration[8.1]
  def change
    create_table :stocks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :category
      t.string :quantity
      t.date :expiration_date

      t.timestamps
    end
  end
end

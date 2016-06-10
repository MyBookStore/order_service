class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :book_id, null: false
      t.string :status, null: false
      t.timestamps null: false
    end
  end
end

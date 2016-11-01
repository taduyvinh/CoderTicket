class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :phonenumber
      t.integer :ticket_types
      t.integer :quantity
      t.integer :cost

      t.timestamps
    end
  end
end

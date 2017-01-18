class AddCustomerIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :kms_orders, :customer_id, :integer, index: true
    add_foreign_key :kms_orders, :kms_customers, column: :customer_id, on_delete: :cascade
  end
end

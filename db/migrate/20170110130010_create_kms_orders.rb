class CreateKmsOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :kms_orders do |t|
      t.belongs_to :cart, index: true

      t.timestamps
    end
    add_foreign_key :kms_orders, :kms_carts, column: :cart_id, on_delete: :cascade
  end
end

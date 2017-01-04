class CreateKmsLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :kms_line_items do |t|
      t.belongs_to :cart, index: true
      t.integer :quantity
      t.belongs_to :variant, index: true

      t.timestamps
    end

    add_foreign_key :kms_line_items, :kms_carts, column: :cart_id, on_delete: :cascade
    add_foreign_key :kms_line_items, :kms_variants, column: :variant_id, on_delete: :cascade
  end
end

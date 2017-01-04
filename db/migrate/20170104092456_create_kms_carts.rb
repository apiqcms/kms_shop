class CreateKmsCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :kms_carts do |t|

      t.timestamps
    end
  end
end

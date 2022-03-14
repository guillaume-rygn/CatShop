class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.decimal :total

      t.timestamps
    end
  end
end

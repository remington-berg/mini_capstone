class Remove < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :product_id
    remove_column :orders, :quantity
  end
end

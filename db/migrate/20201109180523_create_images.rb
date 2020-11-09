class CreateImages < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :product_id, :string
  end
end

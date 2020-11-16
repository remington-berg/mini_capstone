class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories

  # def products
  #   category_products.map do |category_product|
  #     category_product.products
  #   end
  # end
end

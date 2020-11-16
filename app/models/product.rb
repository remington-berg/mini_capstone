class Product < ApplicationRecord
  # validates :name, presence: true, uniqueness: true
  # validates :price, presence: true, numericality: { greater_than: 0 }
  # validates :description, length: { minimum: 10, maximum: 500 }
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :carted_products
  has_many :users, through: :carted_products
  has_many :orders, through: :carted_products

  # def categories
  #   category_products.map do |category_product|
  #     category_product.category_id
  #   end
  # end

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def image
    Image.where(product_id: id)
  end

  def is_discounted?
    price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end

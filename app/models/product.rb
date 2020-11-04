class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { minimum: 10, maximum: 500 }

  def is_discounted?
    price <= 10
  end

  def tax
    @tax = price * 0.09
  end

  def total
    total = price + @tax
  end
end

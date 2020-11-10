class Api::ProductsController < ApplicationController
  def index
    p current_user

    @products = Product.all
    search = params[:search]
    sort = params[:sort]
    sort_order = params[:sort_order]
    discount = params[:discount]

    @products = @products.order(:id)

    if search
      @products = @products.where("name LIKE ?", "%#{search}%")
    end

    if sort == "price" && sort_order == "desc"
      @products = @products.order(price: :desc)
    end

    if sort == "price"
      @products = @products.order(:price)
    end

    if discount
      @products = @products.where("price < 100")
    end

    render "index.json.jb"
  end

  def show
    user_input = params["id"]
    @product = Product.find_by(id: user_input.to_i)
    render "show.json.jb"
  end

  def create
    @product = Product.new({
      name: params["name"],
      price: params["price"],
      # image_url: params["image_url"],
      description: params["description"],
      supplier_id: params["supplier_id"],
    })
    if @product.save
      Image.create!({ product_id: @product.id, images: params["image_url"] })
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    input = params["id"]
    @product = Product.find_by(id: input)
    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    # @product.image_url = params["image_url"] || @product.image_url
    @product.description = params["description"] || @product.description

    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    input = params["id"]
    @product = Product.find_by(id: input)
    @product.destroy
    render json: { message: "Product Destroyed" }
  end
end

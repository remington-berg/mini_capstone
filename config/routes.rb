Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/all_products" => "products#display_products"
    get "/Quinn" => "products#quinn"
    get "/culkin" => "products#culkin"
    get "/jackson" => "products#jackson"
  end
end

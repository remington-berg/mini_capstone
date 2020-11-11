Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/users" => "users#create"

    post "/sessions" => "sessions#create"

    post "orders" => "orders#create"
    get "orders" => "orders#index"
    get "orders/:id" => "orders#show"

    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    post "products" => "products#create"
    patch "products/:id" => "products#update"
    delete "products/:id" => "products#destroy"

    get "suppliers" => "suppliers#index"
    get "/suppliers/:id" => "suppliers#show"
    post "suppliers" => "suppliers#create"
    patch "suppliers" => "suppliers#update"
    delete "suppliers/:id" => "suppliers#destroy"
  end
end

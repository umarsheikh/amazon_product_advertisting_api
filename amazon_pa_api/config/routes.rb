Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'products/prices', to: "products#prices", as: "product_price"
  get 'products/popular', to: "products#popular", as: "popular_products"
end

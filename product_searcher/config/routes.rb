Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "home#search"
  get 'users/settings', to: "users#settings", as: "user_settings"
  get "users/view_invitations", to: "users#view_invitations", as: "user_view_invitations"
end

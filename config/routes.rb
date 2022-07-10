Rails.application.routes.draw do
  get 'restaurants/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "restaurants#index"
end
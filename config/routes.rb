Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats, only: [:index, :new, :create, :show, :edit, :update]
  resources :cat_rental_requests, only: [:new, :create, :show]
end

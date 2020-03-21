Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: 'json' } do
    resources :items
  end

  resources :products

  get 'data_license', to: 'home#data_license'
  get 'documentation', to: 'home#documentation'
  get 'acknowledgements', to: 'home#acknowledgements'

  root to: "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

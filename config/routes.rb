Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    resources :items
  end

  resources :products

  get 'documentation', to: 'home#documentation'
  get 'acknowledgements', to: 'home#acknowledgements'

  root to: "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

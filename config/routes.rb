Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    resources :items
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

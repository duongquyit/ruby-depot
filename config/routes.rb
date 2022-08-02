Rails.application.routes.draw do
  # If you have a dedicated config/environments/staging.rb
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.staging?

  # If you use RAILS_ENV=production in staging environments, you'll need another
  # way to disable it in "real production"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" unless ENV["PRODUCTION_FOR_REAL"]
  
  resources :orders
  resources :line_items
  resources :carts
  root 'store#index', as: 'store_index'
  # get 'store/index'
  resources :products do
    get :who_bought, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
Rails.application.routes.draw do
  namespace :provider do
    resources :books

    root "books#index"
  end
end

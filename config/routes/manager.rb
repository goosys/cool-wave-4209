Rails.application.routes.draw do
  namespace :manager do
    resources :books

    root "books#index"
  end
end

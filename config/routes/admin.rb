Rails.application.routes.draw do
  namespace :admin do
    resources :books

    root "books#index"
  end
end

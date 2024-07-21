Rails.application.routes.draw do
  namespace :admin do
    resources :books
    resources :book_printing_histories

    root "books#index"
  end
end

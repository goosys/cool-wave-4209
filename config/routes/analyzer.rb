Rails.application.routes.draw do
  namespace :analyzer do
    resources :books
    resources :book_printing_histories

    root "overview#home"
  end
end

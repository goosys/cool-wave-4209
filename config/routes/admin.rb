Rails.application.routes.draw do
  namespace :admin do
    resources :books do
      resources :book_printing_histories
    end
    resources :book_printing_histories

    root "overview#home"
  end
end

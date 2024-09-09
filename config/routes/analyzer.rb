Rails.application.routes.draw do
  namespace :analyzer do
    resources :books do
      post :import, on: :collection
      post :import_for_delete, on: :collection
      get :download_csv_format, on: :collection
      get :download_invalid_resource, on: :collection
    end
    resources :book_printing_histories

    root "overview#home"
  end
end

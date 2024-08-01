module Admin
  class BookPrintingHistoriesController < Admin::ApplicationController
    include Administrate::CustomModelForFormFor

    def contextualize_resource(resource)
      if ["new", "create"].include?(action_name) && params[:book_id].present?
        resource.book = Book.find(params[:book_id])
      end
    end

    def custom_model_for_form_for
      if ["new", "create"].include?(action_name) && params[:book_id].present?
        [namespace, Book.find(params[:book_id]), new_resource]
      else
        nil
      end
    end
  end
end

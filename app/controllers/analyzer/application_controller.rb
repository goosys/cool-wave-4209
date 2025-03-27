module Analyzer
  class ApplicationController < Administrate::ApplicationController
    include ::Administrate::Mistybird::RansackSearchFieldPermittedDefault
    include ::ApplicationController::AuthorizeSearchable

    def ransack_options
      {
        ignore_unknown_conditions: false,
        auth_object: self,
      }
    end
  
    private

    def resource_resolver
      @resource_resolver ||=
        Administrate::RoleAwareResourceResolver.new(controller_path)
    end

    helper_method :show_export_button?
    def show_export_button?
      is_exportable?
    end

    def is_exportable?
      @dashboard.collection_export_types.present?
    end
  end
end

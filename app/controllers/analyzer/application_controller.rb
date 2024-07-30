module Analyzer
  class ApplicationController < Administrate::ApplicationController
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

  end
end

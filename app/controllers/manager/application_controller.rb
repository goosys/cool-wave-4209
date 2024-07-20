module Manager
  class ApplicationController < Administrate::ApplicationController
    private

    def resource_resolver
      @resource_resolver ||=
        Administrate::RoleAwareResourceResolver.new(controller_path)
    end

  end
end

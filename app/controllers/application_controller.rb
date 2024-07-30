class ApplicationController < ActionController::Base
  module AuthorizeSearchable
    extend ActiveSupport::Concern
  
    included do
      # see https://github.com/blocknotes/administrate_ransack/blob/master/lib/administrate_ransack/searchable.rb
      prepend AdministrateRansack::Searchable
    end

    def ransack_options
      # raises an exception on unknown parameters
      { ignore_unknown_conditions: false }
    end
  end
end

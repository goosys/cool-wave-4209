Rails.application.config.after_initialize do
  Administrate::Engine.add_javascript 'administrate/administrate'
  Administrate::Engine.add_stylesheet 'administrate/administrate'
  # Administrate::Engine.add_stylesheet 'actiontext'
end

AdministrateRansack.configure do |config|
  config.has_many_field_type_default = :select
end

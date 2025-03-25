Rails.application.config.after_initialize do
  # manifest.jsでlinkしたcssを追加する
  #   administrate/applicationはGem側でadd_stylesheetされているし、Gem側のmanifest.jsでlinkもされているため諸々不要
  #   administrate-field-nested_has_manyはGem側でadd_stylesheetされているためここでは不要
  Administrate::Engine.add_stylesheet 'actiontext' # このactiontextはapp/assets/stylesheetsのactiontext.css
end

AdministrateRansack.configure do |config|
  config.has_many_field_type_default = :select
end

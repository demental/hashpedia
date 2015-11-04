Rails.application.config.assets.version = '1.0'

Rails.application.root.join('vendor/assets/components').to_s.tap do |bower_path|
Rails.application.config.sass.load_paths << bower_path
Rails.application.config.assets.paths << bower_path
end
# Precompile Bootstrap fonts
Rails.application.config.assets.precompile << %r(bootstrap-sass/assets/fonts/bootstrap/[\w-]+\.(?:eot|svg|ttf|woff2?)$)
Rails.application.config.assets.precompile << %r(components-font-awesome/fonts/[\w-]+\.(?:eot|svg|ttf|woff)$)
# Minimum Sass number precision required by bootstrap-sass
::Sass::Script::Value::Number.precision = [8, ::Sass::Script::Value::Number.precision].max


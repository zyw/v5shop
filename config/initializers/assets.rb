# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
# Rails.application.config.assets.version = '1.0'
# Rails.application.config.assets.precompile += %w( fontawesome-webfont.eot )
# Rails.application.config.assets.precompile += %w( fontawesome-webfont.woff )
# Rails.application.config.assets.precompile += %w( fontawesome-webfont.ttf )
# Rails.application.config.assets.precompile += %w( fontawesome-webfont.svg )
# Rails.application.config.assets.precompile += %w( glyphicons-halflings-regular.eot )
# Rails.application.config.assets.precompile += %w( glyphicons-halflings-regular.woff )
Rails.application.config.assets.precompile += [/.*\.js/,/.*\.css/,/.*\.eot/,/.*\.woff/,/.*\.ttf/,/.*\.svg/,/.*\.swf/]
# Rails.application.config.assets.precompile += %w( bootstrap.min.css )
# Rails.application.config.assets.precompile += %w( AdminLTE.css )

# Rails.application.config.assets.precompile += %w( jquery.js )
# Rails.application.config.assets.precompile += %w( bootstrap.min.js )
# Rails.application.config.assets.precompile += %w( font-awesome.css.erb )

# Rails.application.config.assets.precompile += %w( login.css )
# Rails.application.config.assets.precompile += %w( login.js )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

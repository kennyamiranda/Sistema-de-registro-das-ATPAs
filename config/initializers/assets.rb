# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( css_bootstrap/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( devise.css )
Rails.application.config.assets.precompile += %w( js_bootstrap/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( registration.js )
Rails.application.config.assets.precompile += %w( jquery-1.9.1.js )


# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( hide_div_activities.css )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

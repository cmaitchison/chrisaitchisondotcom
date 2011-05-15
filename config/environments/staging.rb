Enki::Application.configure do
  config.cache_classes = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.action_dispatch.x_sendfile_header = "X-Sendfile"
  config.serve_static_assets = false
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_level = :debug
end
#Enki::Config.default[:disqus_name]="chrisaitchisondotcom-staging"
#Enki::Config.default[:disqus_url]="chrisaitchisondotcom-staging.heroku.com"
Enki::Config.default[:disqus_name]="chrisaitchisondotcom"
Enki::Config.default[:disqus_url]="chrisaitchison.com"
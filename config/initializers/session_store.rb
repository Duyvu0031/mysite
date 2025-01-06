Rails.application.config.session_store :cookie_store, 
  key: 'tungduy', 
  secure: Rails.env.production?, 
  same_site: :strict

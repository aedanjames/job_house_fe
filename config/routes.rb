Rails.application.routes.draw do

  root to: 'welcome#index'

  get '/auth/google_oauth2/callback', to: 'users#authorize'
  get '/search/jobs', to: 'search#search_for_jobs'

  get '/dashboard', to: 'users#index'

  delete '/logout', to: 'users#logout'
end

Rails.application.routes.draw do

  root to: 'welcome#index'

  get '/auth/google_oauth2/callback', to: 'users#authorize'
  get '/search/jobs', to: 'searches#jobs_by_location'
end

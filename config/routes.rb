Rails.application.routes.draw do

  root to: 'welcome#index'

  get '/auth/google_oauth2/callback', to: 'users#authorize'
end

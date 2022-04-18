Rails.application.routes.draw do

  root to: 'welcome#index'

  get '/auth/google_oauth2/callback', to: 'users#authorize'
  
  get '/search/jobs', to: 'search#search_for_jobs'

  namespace :search do 
    get '/jobs', to: 'search#search_for_jobs'
    get '/jobs/results', to: 'jobs#index'
    post '/jobs/show', to: 'jobs#show'
    post '/jobs/save', to: 'jobs#save'
  end 

  get '/dashboard', to: 'users#index'

  delete '/logout', to: 'users#logout'
end

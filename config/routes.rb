Rails.application.routes.draw do

  root to: 'welcome#index'

  get '/about', to: 'welcome#about'

  get '/auth/google_oauth2/callback', to: 'users#authorize'

  get '/search/jobs', to: 'search#search_for_jobs'
  get '/search/houses', to: 'search#search_for_houses'

  get '/jobs/:job_id/houses/saved', to: 'job_house#saved'
  delete '/jobs/:job_id/houses/:house_id', to: 'job_house#delete_house'
  post '/jobs/:job_id/:house_id', to: 'job_house#save_house'

  namespace :search do
    get '/jobs', to: 'search#search_for_jobs'
    get '/jobs/results', to: 'jobs#index'
    post '/jobs/show', to: 'jobs#show'
    post '/jobs/save', to: 'jobs#save'
    
    get '/houses/results', to: 'houses#index'
  end
  post '/houses/:mls_id/save', to: 'houses#save'
  delete '/houses/:mls_id/destroy', to: 'houses#destroy'

  get '/dashboard', to: 'users#index'

  delete '/logout', to: 'users#logout'

  resources :jobs, only: [:show, :destroy], controller: :job_house
  get '/houses/:mls_id/jobs', to: 'house_jobs#index'
  post '/houses/jobs/show', to: 'house_jobs#show'
  get '/houses/jobs/saved', to: 'house_jobs#saved'
  get '/houses/:mls_id/:realtor_contact', to: 'users#email_realtor'

end
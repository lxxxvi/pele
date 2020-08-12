Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'
  get '/graphiql', to: 'graphql#graphiql', layout: false

  namespace :admin do
    resources :sessions, only: %i[new create]
    get :sign_out, to: 'sessions#destroy'
    resources :tournament_matches, only: %i[index edit update]
    root to: redirect('/admin/tournament_matches')
  end
end

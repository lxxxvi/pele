Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  root to: redirect('/tournament_matches')

  resources :tournament_matches, only: %i[index edit update]
end

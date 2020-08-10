Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"

  namespace :admin do
    resources :tournament_matches, only: %i[index edit update]
    root to: redirect('/admin/tournament_matches')
  end
end

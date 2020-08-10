Rails.application.routes.draw do
  root to: redirect('/tournament_matches')

  resources :tournament_matches, only: %i[index edit update]
end

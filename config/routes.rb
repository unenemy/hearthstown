Rails.application.routes.draw do
  namespace :api do
    resources :card_scores
  end
  get '/design/(:page)', to: 'design#page'
end

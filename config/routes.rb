Rails.application.routes.draw do
  root "top_pages#top"

  get 'login', to: 'user_sessions#new'
  post 'login', to:'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :goals, only: %i[index]
end

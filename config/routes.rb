Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/sessions/new' => 'sessions#new', as: :new_session
  post '/sessions' => 'sessions#create', as: :sign_in
  get '/sessions/welcome' => 'sessions#welcome', as: :welcome
  delete '/sessions' => 'sessions#destroy', as: :logout

  resources :books

  root to: 'sessions#welcome'
end

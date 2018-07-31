Rails.application.routes.draw do
  resources :tasks
  root 'stories#index'

  resources :stories

  get '/sort' => 'stories#sort', as: 'sort'


  resources :sprints
end

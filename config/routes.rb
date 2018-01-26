Rails.application.routes.draw do
  resources :tasks
  root 'stories#index'

  resources :stories

  put '/stories/sort?' => 'story#sort', as: 'sort'


  resources :sprints
end

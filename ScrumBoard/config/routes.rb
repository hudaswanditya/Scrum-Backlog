Rails.application.routes.draw do
  resources :tasks
  root 'stories#index'

  resources :stories do
    collection do
      patch :sort
    end
  end


  resources :sprints
end

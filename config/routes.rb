Rails.application.routes.draw do
  get 'roles/nominate_admin'
  get 'roles/remove_admin'
  get 'logout/destroy'
  devise_for :users
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # delete 'users/:id', to: 'home#destroy', as: 'delete_user'
  delete 'users/:id', to: 'home#destroy', as: :delete_user

  put 'toggle_role_user/:id', to: 'home#toggle_role_user', as: 'toggle_role_user'

  # Route spécifique pour la suppression d'un projet
  get '/logout', to: 'logout#destroy', as: :logout

  root "home#index"
  resources :projects
end

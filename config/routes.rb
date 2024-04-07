Rails.application.routes.draw do
  get 'roles/nominate_admin'
  get 'roles/remove_admin'
  get 'logout/destroy'
  devise_for :users

  # delete 'users/:id', to: 'home#destroy', as: 'delete_user'
  delete 'users/:id', to: 'home#destroy', as: :delete_user

  put 'toggle_role_user/:id', to: 'home#toggle_role_user', as: 'toggle_role_user'

  # Route spécifique pour la suppression d'un projet
  get '/logout', to: 'logout#destroy', as: :logout

  root "home#index"
  # resources :projects

  get 'projects/:id/add_user', to: 'projects#add_user', as: 'add_user_to_project'

  # resources :projects do
  #   post 'add_user', on: :member
  # end
end


Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :todos
  patch 'todos/:id/done' => 'todos#done'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "todos#index"
end

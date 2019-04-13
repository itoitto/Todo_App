Rails.application.routes.draw do
  resources :todos
  patch 'todos/:id/done' => 'todos#done'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

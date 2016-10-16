Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'statics#home'

  resources :users, except: [:show]
  resources :students
  resources :lessons
  resources :assistances, only: [:create]

  get '/students_menu' => "statics#students_menu"
  get '/lessons_menu' => "statics#lessons_menu"

end

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'statics#home'

  resources :students
  resources :lessons

  get '/students_menu' => "statics#students_menu"
  get '/lessons_menu' => "statics#lessons_menu"


end

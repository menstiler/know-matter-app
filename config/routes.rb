Rails.application.routes.draw do
  get '/welcome' => "welcome#home", as: "welcome"
  get '/book/:id' => "lessons#book"
  post '/lessons' => "lessons#create_new_lesson"
  get '/lessons' => "lessons#index"

  resources :teachers, only: [:index, :show]
  resources :hobbies, only: [:index, :show]
  resources :students
  get '/' => "sessions#new", as: "login"
  post '/' => "sessions#create"
  delete '/logout' => "sessions#destroy", as: "logout"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

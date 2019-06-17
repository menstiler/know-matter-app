Rails.application.routes.draw do
  get '/welcome' => "welcome#home", as: "welcome"
  post '/lessons' => "lessons#create_new_lesson"
  get '/lessons' => "lessons#index"
  get '/thank_you' => "lessons#thank_you", as: "thank_you"
  delete '/lessons/:id' => "lessons#cancel_lesson", as: "cancel_lesson"
  get '/hobbies/show/:name' => "hobbies#show_by_category"


  resources :teachers, only: [:index, :show, :new, :create]
  resources :hobbies, only: [:index, :show, :new, :create]
  resources :students

  get 'students/:id/lessons' => "students#lessons", as: "your_lessons"

  get '/' => "sessions#new", as: "login"
  post '/' => "sessions#create"
  delete '/logout' => "sessions#destroy", as: "logout"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

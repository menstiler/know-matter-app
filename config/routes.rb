Rails.application.routes.draw do
  get '/welcome' => "welcome#home", as: "welcome"

  post '/lessons' => "lessons#create_new_lesson"
  get '/lessons' => "lessons#index"
  get '/thank_you' => "lessons#thank_you", as: "thank_you"
  delete '/lessons/:id' => "lessons#cancel_lesson", as: "cancel_lesson"
  get '/hobbies/show/:name' => "hobbies#show_by_category"

  resources :teachers, only: [:index, :show, :new, :create]
  resources :hobbies, only: [:index, :show, :new, :create]

  post '/reviews' => "reviews#create"
  get '/success_delete' => "reviews#success_delete", as: "success_delete"
  get '/success_edit' => "reviews#success_edit", as: "success_edit"
  get '/reviews/:id/edit' => "reviews#edit", as: "edit_review"
  get '/reviews/:id' => "reviews#new", as: "new_review"
  post '/reviews/:id' => "reviews#update"
  delete '/reviews/:id' => "reviews#destroy", as: "delete_review"

  resources :reviews
  resources :students

  get 'students/:id/lessons' => "students#lessons", as: "your_lessons"

  get '/' => "sessions#new", as: "login"
  post '/' => "sessions#create"
  delete '/logout' => "sessions#destroy", as: "logout"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

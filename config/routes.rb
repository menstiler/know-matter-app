Rails.application.routes.draw do
  get '/welcome' => "welcome#home", as: "welcome"
  get '/teacher_welcome' => "welcome#teacher_home", as: "teacher_welcome"

  post '/lessons' => "lessons#request_new_lesson", as: "request_new_lesson"
  post '/lessons/:id' => "lessons#create_new_lesson", as: "new_lesson"
  get '/lessons' => "lessons#index"
  get '/thank_you' => "lessons#thank_you", as: "thank_you"
  delete '/lessons/:id' => "lessons#cancel_lesson", as: "cancel_lesson"
  post '/lessons/:id/request_cancel' => "lessons#request_cancel", as: "request_cancel"
  delete '/students/:id/lessons' => "students#clear_lessons", as: "clear_lessons"
  get '/hobbies/show/:name' => "hobbies#show_by_category"

  get '/select_hobby' => "teachers#select_hobby", as: "select_hobby"
  post '/teachers/create_profile' => "teachers#create_profile"
  get '/teachers/:id/create_profile' => "teachers#existing_hobby_create_profile"
  get '/timeslots/new' => "bookings#new"

  resources :teachers
  resources :hobbies, only: [:index, :show, :new, :create]
  resources :bookings, only: [:index, :show, :new, :create]
  resources :timeslots, only: [:index, :show, :new, :create]

  get '/bookings/new' => "bookings#new"
  post '/bookings' => "bookings#create"

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

  get '/teacher_login' => "sessions#new_teacher", as: "teacher_login"
  post '/teacher_login' => "sessions#create_teacher"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

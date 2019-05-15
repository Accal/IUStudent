Rails.application.routes.draw do
  root to: 'courses#index'

  devise_for :admins
  devise_for :professors
  devise_for :students

  resources :courses do
    collection {post :import}
  end

  # Custom routes for students
  resources :students, :only => [:add_course, :remove_course] do
    member do
      post 'add_course'
      delete 'remove_course'
    end
  end

  get 'students/(:id)/profile', to: 'students#show', as: 'student_profile'
  get 'students/(:id)/calendar', to: 'students#calendar', as: 'student_calendar'

  # Custom routes for professors
  resources :professors, :only => [:index, :add_course, :remove_course] do
    member do
      post 'add_course'
      delete 'remove_course'
    end
  end
  
  get 'professors/(:id)/profile', to: 'professors#show', as: 'professor_profile'
  get 'professors/(:id)/calendar', to: 'professors#calendar', as: 'professor_calendar'

  # Custom routes for static pages
  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'map', to: 'static_pages#map'
  get 'login', to: 'static_pages#login'
  get 'register', to: 'static_pages#register'
end

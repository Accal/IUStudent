Rails.application.routes.draw do
  root to: 'courses#index'

  devise_for :admins
  devise_for :professors
  devise_for :students

  resources :courses do
    collection {post :import}
  end

  resources :students, :only => [:add_course, :remove_course] do
    member do
      post 'add_course'
      delete 'remove_course'
    end
  end

  get 'students/profile/(:id)', to: 'students#show', as: 'profile'
  get 'students/calendar/(:id)', to: 'students#calendar', as: 'calendar'

  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'map', to: 'static_pages#map'
end

Rails.application.routes.draw do
  root to: 'courses#index'

  devise_for :admins
  devise_for :professors
  devise_for :students

  resources :courses do
    collection {post :import}
  end

  resources :students, :only => [:add_course] do
    member do
      post 'add_course'
    end
  end
end

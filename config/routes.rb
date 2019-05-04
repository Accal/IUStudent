Rails.application.routes.draw do
  root to: 'courses#index'

  resources :courses do
    collection {post :import}
  end
<<<<<<< HEAD

=======
  resources :courses
>>>>>>> 7b69127a83aed6e5e622cd4f9f86c14f81204aa9
  devise_for :admins
  devise_for :professors
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

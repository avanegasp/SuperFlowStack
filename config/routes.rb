
Rails.application.routes.draw do
  get 'comments/edit'

  get 'comments/create'

  get 'comments/delete'

  get 'comments/update'

  root "questions#index"
  devise_for :users

  resources :questions

  resources :question do
    resources :comments
  end

  resources :questions do
    resources :answers
  end


  resources :answers do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

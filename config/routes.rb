
Rails.application.routes.draw do
  root "questions#index"
  devise_for :users

  resources :questions

  resources :questions do
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

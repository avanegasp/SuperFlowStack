
Rails.application.routes.draw do
  get 'votes/index'

  get 'votes/show'

  get 'votes/create'

  get 'votes/new'

  get 'votes/edit'

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

  resources :questions do
    resources :votes
  end

  resources :answers do
    resources :votes
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


Rails.application.routes.draw do
  root "questions#index"
  devise_for :users
  concern :categorizable do
    resources :comments
  end
  resources :questions, concerns: :categorizable
  resources :answers, concerns: :categorizable

#   resources :questions do
#   	resources :comments, shallow: true
# end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

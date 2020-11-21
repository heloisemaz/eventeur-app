Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events do
    resources :comments, only: %i[index new create]
  end
  resources :comments, only: [:show]
end

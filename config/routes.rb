Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'events#index'
  resources :events, except: %i[edit update destroy] do
    resources :comments, only: %i[index new create]
  end
  resources :comments, only: [:show]
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static_pages#root'

  namespace :api do
    resources :users, only: %i[show create]
    resources :responses, only: %i[create destroy]
    resources :stories, only: %i[index show create update destroy]
    resource :session, only: %i[new create destroy]
  end

  get '*path', to: 'static_pages#root', via: :all
end

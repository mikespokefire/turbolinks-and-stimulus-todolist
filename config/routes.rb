Rails.application.routes.draw do
  resources :todos do
    member do
      post :toggle
    end
  end

  root to: 'todos#index'
end

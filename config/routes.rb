Rails.application.routes.draw do
  root to: 'songs#index'
  resources :songs, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  delete '/songs/:id', to: 'songs#destroy', as: 'destroy'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  # Liberando rotas expecíficas
  resources :manufacturers, only: [:index, :show, :new, :create, :edit, :update] 
end


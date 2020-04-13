Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Saber as rotas do projeto: rake routes

  root to: 'home#index'

  # Liberando rotas expecíficas
  # resources :manufacturers, only: [:index, :show, :new, :create, :edit, :update, :destroy] 

  # Agora posso apagar o only pq to usando todas as rotas
  resources :manufacturers

  resources :subsidiaries

end
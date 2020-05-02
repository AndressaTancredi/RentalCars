Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Saber as rotas do projeto: rake routes

  root to: 'home#index'

  # Liberando rotas expecíficas
  # resources :manufacturers, only: [:index, :show, :new, :create, :edit, :update, :destroy] 

  # Agora posso apagar o only pq to usando todas as rotas
  resources :manufacturers

  resources :subsidiaries

  resources :car_categories

  # %i faz um array de symbols (dois pontos e vírgula)
  # %w faz um array de texto (string e vírgula)
  resources :car_models, only: %i[index new create show]

  resources :rentals, only: %i[index new create] do
    get 'search', on: :collection #Uma rota customizada dentro do rental, resultado: search_rentals_path
  end
end
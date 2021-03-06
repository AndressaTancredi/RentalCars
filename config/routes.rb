Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Saber as rotas do projeto: rake routes

  root to: 'home#index'

  # Liberando rotas expecíficas
  # resources :manufacturers, only: [:index, :show, :new, :create, :edit, :update, :destroy] 

  # Agora posso apagar o only pq to usando todas as rotas
  resources :clients do
    get 'search', on: :collection #Busca na coleção inteira.
  end

  resources :manufacturers

  resources :subsidiaries

  resources :car_categories

  # %i faz um array de symbols (dois pontos e vírgula)
  # %w faz um array de texto (string e vírgula)
  resources :car_models, only: %i[index new create show]

  resources :rentals, only: %i[index new create show] do
    resources :car_rentals, only: [:create] # Nested rotas.
    get 'search', on: :collection #Uma rota customizada dentro do rental, resultado: search_rentals_path
    get 'start', on: :member 
    post 'start', on: :member, to: 'rentals#confirm'
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :cars, only: %i[index show create]
    end
  end

  # TODO consumir uma API externa. Tipos de testes.
end
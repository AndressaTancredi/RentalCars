class CarRental < ApplicationRecord
  # Esse model é para associar uma rental e car em um determinado momento, pq a locação no futuro pode mudar de preço e seria legal consultar o passado com o valor correspondente áquela época.
  # CarRental é o aluguel de fato, rental é o pedido e car o produto.
  # Se eu quiser criar uma feature para excluir a locação, seria excluir CarRental
  belongs_to :rental
  belongs_to :car
  belongs_to :user
end

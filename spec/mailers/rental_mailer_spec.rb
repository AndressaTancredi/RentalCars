require 'rails_helper'

describe RentalMailer do
  describe '#rental_scheduled' do
    it 'should send the confirmation data' do

      #Arrange
      car_category = CarCategory.create!(name: 'A', daily_rate: 100, 
        car_insurance: 100, third_part_insurance: 100)
      client = Client.create!(name: 'Fulano Sicrano', document: '57810023594',
      email: 'teste@teste.com.br')
      # TODO 1.day.from.now
      rental = Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
      client: client, car_category: car_category)

      #Act
      # Pego pelo id para buscar de forma específica caso um cliente tenha cancelado a locação NÃO vai enviar email
      mail = RentalMailer.rental_scheduled(rental.id)

      #Assert
      expect(mail.body).to include rental.code
      expect(mail.body).to include '16/04/2030'

    end

    it 'should send to the client email' do

      #Arrange
      car_category = CarCategory.create!(name: 'A', daily_rate: 100, 
        car_insurance: 100, third_part_insurance: 100)
      client = Client.create!(name: 'Fulano Sicrano', document: '57810023594',
      email: 'teste@teste.com.br')
      # TODO 1.day.from.now
      rental = Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
      client: client, car_category: car_category)

      #Act
      # Pego pelo id para buscar de forma específica caso um cliente tenha cancelado a locação NÃO vai enviar email
      mail = RentalMailer.rental_scheduled(rental.id)
      
      #Assert
      expect(mail.subject).to eq("Confirmação de Agendamento - #{ rental.code }")
      expect(mail.to).to include 'teste@teste.com.br'
    end
  end
  # TODO Fazer teste para quando iniciar/terminar a locação
end
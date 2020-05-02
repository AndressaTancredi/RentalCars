require 'rails_helper'

RSpec.describe Rental, type: :model do
  context '#code' do
    it 'created automatically' do
      user = User.create!(email: 'test@test.com.br', password: '12345678')
      car_category = CarCategory.create!(name: 'A', daily_rate: 20,
                                         car_insurance: 100,
                                         third_part_insurance: 200)
      client = Client.create!(name:'Fulano Sicrano', 
                              document: '578.100.235-94', 
                              email: 'teste@teste.com.br')
      rental = Rental.new(start_date: '16/04/2030', end_date: '18/04/2030', 
                     client: client , car_category: car_category)
      
      rental.save!

      expect(rental.code.size).to eq(6)
    end
    # TODO: Validações
  end
end
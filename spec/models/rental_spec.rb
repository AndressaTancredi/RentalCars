require 'rails_helper'

RSpec.describe Rental, type: :model do
  context '#code' do
    it 'created automatically' do
      user = User.create!(email: 'test@test.com.br', password: '12345678')
      car_category = CarCategory.create!(name: 'A', daily_rate: 20,
                                         car_insurance: 100,
                                         third_part_insurance: 200)
      client = Client.create!(name:'Fulano Sicrano', 
                              document: '57810023594', 
                              email: 'teste@teste.com.br')
      rental = Rental.new(start_date: '16/04/2030', end_date: '18/04/2030', 
                     client: client , car_category: car_category)
      
      rental.save!

      expect(rental.code.size).to eq(6)
    end
    # TODO: Stub de código único. (Ver mais na doc)
    # allow(SecureRandom).to receive(:alphanumeric).and_return('ABC123').twice
  end

  context '#status' do
    it 'default to scheduled' do
      user = User.create!(email: 'test@test.com.br', password: '12345678')
      car_category = CarCategory.create!(name: 'A', daily_rate: 20,
                                         car_insurance: 100,
                                         third_part_insurance: 200)
      client = Client.create!(name:'Fulano Sicrano', 
                              document: '57810023594', 
                              email: 'teste@teste.com.br')
      rental = Rental.new(start_date: '16/04/2030', end_date: '18/04/2030', 
                     client: client , car_category: car_category)
      
      rental.save!

      # rental.scheduled? método que vem do enum
      # preciso add no model = rails g migration add_status_to_rental status:integer
      expect(rental.scheduled?).to be true
    end
  end
end
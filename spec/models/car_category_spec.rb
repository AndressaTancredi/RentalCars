require 'rails_helper'

describe CarCategory, type: :model do
  context 'validation' do
    it 'the name cannot be blanck' do

      car_category = CarCategory.new

      car_category.valid?

      expect(car_category.errors[:name]).to include('não pode ficar em branco')
    end

    it 'and name must be unique' do
      CarCategory.create!(name: "B")
      car_category = CarCategory.new(name:"B")

      car_category.valid?
      
      expect(car_category.errors[:name]).to include('já está em uso')
    end

    it 'and the daily_rate value must be greater than 0' do
      car_category = CarCategory.create(daily_rate: 0)
      
      car_category.valid?

      expect(car_category.errors[:daily_rate]).to include('deve ser maior que 0')

    end

    it 'and the car_insurance value must be greater than 0' do
      car_category = CarCategory.create(car_insurance: 0)
      
      car_category.valid?

      expect(car_category.errors[:car_insurance]).to include('deve ser maior que 0')

    end

    it 'and the third_part_insurance value must be greater than 0' do
      car_category = CarCategory.create(third_part_insurance: 0)
      
      car_category.valid?

      expect(car_category.errors[:third_part_insurance]).to include('deve ser maior que 0')

    end
  end
end
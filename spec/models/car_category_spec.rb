require 'rails_helper'

describe CarCategory, type: :model do
  context 'validation' do
    it 'the name cannot be blanck' do
      car_category = CarCategory.new
      car_category.valid?

      expect(car_category.errors[:name]).to include('não pode ficar em branco')
      expect(car_category.errors[:daily_rate]).to include('não pode ficar em branco')
      expect(car_category.errors[:car_insurance]).to include('não pode ficar em branco')
      expect(car_category.errors[:third_part_insurance]).to include('não pode ficar em branco')
    end

    it 'and name must be unique' do
      CarCategory.create!(name: "B", daily_rate: 10, car_insurance: 10, third_part_insurance: 10)
      car_category = CarCategory.new(name:"B", daily_rate: 10, car_insurance: 10, third_part_insurance: 10)
      car_category.valid?
      
      expect(car_category.errors[:name]).to include('já está em uso')
    end

    it 'and the values must be greater than 0' do
      car_category = CarCategory.create(daily_rate: 0, car_insurance: 0, third_part_insurance: 0)
      car_category.valid?

      expect(car_category.errors[:daily_rate]).to include('deve ser maior que 0')
      expect(car_category.errors[:car_insurance]).to include('deve ser maior que 0')
      expect(car_category.errors[:third_part_insurance]).to include('deve ser maior que 0')
    end
  end
end
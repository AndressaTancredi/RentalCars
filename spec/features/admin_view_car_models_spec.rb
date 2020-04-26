require 'rails_helper'

feature 'Admin view car models available' do
  scenario 'successfully' do

    fiat = Manufacturer.create!(name:'Fiat')
    honda = Manufacturer.create!(name:'Honda')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 20, third_part_insurance: 20)
    cat_d = CarCategory.create!(name: 'D', daily_rate: 50, car_insurance: 20, third_part_insurance: 20)

    CarModel.create!(name:'Mobi', manufacturer: fiat, car_category: cat_a) 
    CarModel.create!(name:'Civic', manufacturer: honda, car_category: cat_d)

    visit root_path
    click_on 'Modelos de Carros'
    
    expect(page).to have_content('Fiat')
    expect(page).to have_content('Mobi')
    expect(page).to have_content('A')

    expect(page).to have_content('Honda')
    expect(page).to have_content('Civic')
    expect(page).to have_content('D')
  end
end
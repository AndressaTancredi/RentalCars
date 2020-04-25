require 'rails_helper'

feature 'Admin view car models' do
  scenario 'successfully' do

    honda = Manufacturer.create(name: 'Honda')
    cat_a = CarCategory.create(name: 'B')

    CarModel.create!(name: 'Civic', manufacturer: honda, car_category: cat_a )
   

    visit root_path
    click_on 'Modelos'
    
    expect(page).to have_content('Civic')
    expect(page).to have_content('Honda')
    expect(page).to have_content('B')



  end
end
require 'rails_helper'

feature 'User search rental' do
  scenario 'successfully' do
    user = User.create!(email: 'test@test.com.br', password: '12345678')
    car_category = CarCategory.create!(name: 'A', daily_rate: 20,
                                       car_insurance: 100,
                                       third_part_insurance: 200)
    client = Client.create!(name:'Fulano Sicrano', 
                            document: '57810023594', 
                            email: 'teste@teste.com.br')
    rental = Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030', client: client , car_category: car_category)
    another_rental = Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030', client: client , car_category: car_category)

    # Uma forma de inspecionar o obj para ver se o código está sendo gerado => puts rental.inspect

    login_as user, scope: :user
    visit root_path
    click_on 'Locações'
    fill_in 'Busca', with: rental.code
    click_on 'Pesquisar'

    expect(page).to have_content(rental.code)
    expect(page).not_to have_content(another_rental.code)
    end
end
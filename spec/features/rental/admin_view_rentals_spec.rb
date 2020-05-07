require 'rails_helper'

feature 'Admin view rentals' do
  scenario 'succesfully' do
    car_category = CarCategory.create!(name: 'A', daily_rate: 20, car_insurance: 20, third_part_insurance: 20)
    client = Client.create!(name:'Fulano Sicrano', document: '57810023594', email: 'teste@teste.com.br')

    Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030', client: client , car_category: car_category)

    user = User.create!(email: 'test@test.com.br', password: '12345678')
    login_as(user, scope: :user)
    
    visit root_path
    click_on 'Locações'

    expect(page).to have_content('16/04/2030')
    expect(page).to have_content('18/04/2030')
    expect(page).to have_content('Fulano Sicrano')
    expect(page).to have_content('A')
  end

  scenario 'and do not have any' do
    user = User.create!(email: 'test@test.com.br', password: '12345678')
    login_as(user, scope: :user)

    visit root_path
    click_on 'Locações'

    expect(page).not_to have_content('16/04/2030')
    expect(page).not_to have_content('18/04/2030')
    expect(page).not_to have_content('Fulano Sicrano')
    expect(page).not_to have_content('A')
  end

  scenario 'and must be logged in' do

    visit rentals_path # Visitar direto sem logar para dar erro

    expect(current_path).to eq(new_user_session_path)
  end
end
require 'rails_helper'

feature 'Admin register car model' do
  scenario 'successfully' do
    fiat = create(:manufacturer, name: 'Fiat')
    cat_a = create(:car_category, name: 'A')
    
    user = User.create!(email: 'test@test.com.br', password: '12345678')
    login_as(user, scope: :user)
    
    visit root_path
    click_on "Modelos de Carros"
    click_on "Cadastrar novo modelo de carro"

    fill_in 'Nome', with: 'Mobi'
    fill_in 'Combustível', with: 'flex'
    fill_in 'Motor', with: '1.0'
    fill_in 'Ano', with: '2020'
    select 'Fiat', from: 'Fabricante'
    select 'A', from: 'Categoria'
    click_on 'Enviar'
    
    expect(page).to have_content('Mobi')
    expect(page).to have_content('Fabricante: Fiat')
    expect(page).to have_content('Categoria: A')
    expect(page).to have_content('Combustível: flex')
    expect(page).to have_content('Motor: 1.0')
    expect(page).to have_content('Ano: 2020')
  end

  # TODO Arrumar i18n
  # Fazer _form
end
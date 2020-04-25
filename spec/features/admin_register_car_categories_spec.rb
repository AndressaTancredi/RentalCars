require 'rails_helper'

feature 'Admin register car categories' do
  scenario 'successfuly' do

    visit root_path
    click_on 'Registrar nova categoria de carro'
    fill_in 'Nome', with: 'A'
    fill_in 'Diária', with: '50'
    fill_in 'Seguro', with: '20'
    fill_in 'Seguro para terceiros', with: '20'
    click_on 'Enviar'

    expect(page).to have_content('Categoria A')
    # Colocamos os valores abaixo como string pq na leitura HTTP será feita como string, mas a programação como float.
    expect(page).to have_content('Diária: R$ 50,00')
    expect(page).to have_content('Seguro: R$ 20,00')
    expect(page).to have_content('Seguro para terceiros: R$ 20,00')

  end

  scenario 'and name cannot be blanck' do
    visit root_path
    click_on 'Registrar nova categoria de carro'
    fill_in 'Nome', with: ''
    fill_in 'Diária', with: '50'
    fill_in 'Seguro', with: '20'
    fill_in 'Seguro para terceiros', with: '80'
    click_on 'Enviar'

    expect(page).to have_content('não pode ficar em branco')

  end

  scenario 'and name must be unique' do
    CarCategory.create!(name: "B")

    visit root_path
    click_on 'Registrar nova categoria de carro'
    fill_in 'Nome', with: 'B'
    click_on 'Enviar'

    expect(CarCategory.count).to eq 1
    expect(page).to have_content('já está em uso')
    
  end

  scenario 'and the daily_rate value must be greater than 0' do
    CarCategory.create(daily_rate: 0)

    visit root_path
    click_on 'Registrar nova categoria de carro'
    fill_in 'Diária', with: '0'
    click_on 'Enviar'

    expect(page).to have_content('deve ser maior que 0')

  end

  scenario 'and the car_insurance value must be greater than 0' do
    CarCategory.create(car_insurance: 0)

    visit root_path
    click_on 'Registrar nova categoria de carro'
    fill_in 'Seguro', with: '0'
    click_on 'Enviar'

    expect(page).to have_content('deve ser maior que 0')

  end

  scenario 'and the third_part_insurance value must be greater than 0' do
    CarCategory.create(third_part_insurance: 0)

    visit root_path
    click_on 'Registrar nova categoria de carro'
    fill_in 'Seguro para terceiros', with: '0'
    click_on 'Enviar'

    expect(page).to have_content('deve ser maior que 0')

  end

  scenario 'and return to home page' do

    visit root_path
    click_on 'Registrar nova categoria de carro'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
end
require 'rails_helper'

feature 'User log in' do
  scenario 'successfully' do
    User.create!(email: 'test@test.com.br', password: '12345678')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'test@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content('Login efetuado com sucesso')
    expect(page).to have_link('Fabricantes')
    expect(page).to have_link('Registrar nova categoria de carro')
    expect(page).to have_link('Modelos de Carros')
    expect(page).to have_link('Locações')
    expect(page).to have_link('Logout')
    expect(page).not_to have_link('Entrar')
    expect(page).to have_link('Home')
  end

  scenario 'and logout' do
    user = User.create!(email: 'test@test.com.br', password: '12345678')
    login_as(user, scope: :user)
    visit root_path
    click_on 'Logout'

    expect(page).to have_content('Saiu com sucesso')
    expect(page).not_to have_link('Logout')
    expect(page).to have_link('Entrar')
    expect(page).not_to have_link('Fabricantes')
    expect(page).not_to have_link('Registrar nova categoria de carro')
    expect(page).not_to have_link('Modelos de Carros')
    expect(page).not_to have_link('Locações')
    expect(page).to have_link('Home')
  end
end 
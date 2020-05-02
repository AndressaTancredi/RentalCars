require 'rails_helper'

feature 'Admin edits manufacturer' do
  scenario 'successfully' do
    m = Manufacturer.create(name: 'Fiat')

    user = User.create!(email: 'test@test.com.br', password: '12345678')
    login_as(user, scope: :user)

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Editar'
    fill_in 'Nome', with: 'Honda'
    click_on 'Enviar'

    expect(current_path).to eq manufacturer_path(m.id)
    expect(page).to have_content('Honda')
    expect(page).not_to have_content('Fiat')

  end

  scenario 'and name cannot be blanck' do
    Manufacturer.create(name: 'Fiat')

    user = User.create!(email: 'test@test.com.br', password: '12345678')
    login_as(user, scope: :user)

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('não pode ficar em branco')
  end

  scenario 'and name must be unique' do
    Manufacturer.create(name: 'Fiat')
    Manufacturer.create(name: 'Honda')

    user = User.create!(email: 'test@test.com.br', password: '12345678')
    login_as(user, scope: :user)

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Editar'
    fill_in 'Nome', with: 'Honda'
    click_on 'Enviar'

    expect(page).to have_content('já está em uso')
  end
end

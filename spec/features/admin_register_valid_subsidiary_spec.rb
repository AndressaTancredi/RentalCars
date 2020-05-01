require 'rails_helper'

feature 'Admin register valid subsidiary' do
  scenario 'and cnpj must be unique' do
    Subsidiary.create!(name: 'Tatuapé', cnpj: '123', address: 'Rua Vilela')

    user = User.create!(email: 'test@test.com.br', password: '12345678')
    login_as(user, scope: :user)

    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Tatuapé'
    fill_in 'CNPJ', with: '123'
    fill_in 'Endereço', with: 'Rua Vilela'
    click_on 'Enviar'
    
    expect(Subsidiary.count).to eq 1
    expect(page).to have_content('CNPJ já está em uso')
  end

  scenario 'and cnpj cannot be blank' do
    
    user = User.create!(email: 'test@test.com.br', password: '12345678')
    login_as(user, scope: :user)

    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Tatuapé'
    fill_in 'CNPJ', with: ''
    fill_in 'Endereço', with: 'Rua Vilela'
    click_on 'Enviar'

    expect(page).to have_content('CNPJ não pode ficar em branco')
  end
end
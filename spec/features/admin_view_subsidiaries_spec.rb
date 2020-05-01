require 'rails_helper'

feature 'Admin view subsidiaries' do
  scenario 'successfully' do
    #Arrange:
    Subsidiary.create!(name: 'Tatuapé', cnpj: '123', address: 'Rua Vilela')
    Subsidiary.create!(name: 'Bela Vista', cnpj: '321', address: 'Rua Manuel Dutra')

    #Act

    user = User.create!(email: 'test@test.com.br', password: '12345678')
    login_as(user, scope: :user)

    visit root_path
    click_on 'Filiais'

    #Assert
    expect(page).to have_content('Tatuapé')
    expect(page).to have_content('Bela Vista')
  end

  scenario 'and view details' do
    Subsidiary.create!(name: 'Tatuapé', cnpj: '123', address: 'Rua Vilela')
    Subsidiary.create!(name: 'Bela Vista', cnpj: '321', address: 'Rua Manuel Dutra')

    #Act
    user = User.create!(email: 'test@test.com.br', password: '12345678')
    login_as(user, scope: :user)

    visit root_path
    click_on 'Filiais'
    click_on 'Tatuapé'

    #Assert
    expect(page).to have_content('Rua Vilela 123 Tatuapé')
    expect(page).not_to have_content('Rua Manuel Dutra - 321 - Bela Vista')
  end

  scenario 'and no Subsidiary are created' do

    user = User.create!(email: 'test@test.com.br', password: '12345678')
    login_as(user, scope: :user)

    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Nenhuma filial cadastrada')
  end

  scenario 'and return to home page' do
    Subsidiary.create!(name: 'Tatuapé', cnpj: '123', address: 'Rua Vilela')
    Subsidiary.create!(name: 'Bela Vista', cnpj: '321', address: 'Rua Manuel Dutra')

    user = User.create!(email: 'test@test.com.br', password: '12345678')
    login_as(user, scope: :user)

    visit root_path
    click_on 'Filiais'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to subsidiaries page' do
    Subsidiary.create!(name: 'Tatuapé', cnpj: '123', address: 'Rua Vilela')
    Subsidiary.create!(name: 'Bela Vista', cnpj: '321', address: 'Rua Manuel Dutra')

    user = User.create!(email: 'test@test.com.br', password: '12345678')
    login_as(user, scope: :user)

    visit root_path
    click_on 'Filiais'
    click_on 'Tatuapé'
    click_on 'Voltar'

    expect(current_path).to eq subsidiaries_path
  end

end


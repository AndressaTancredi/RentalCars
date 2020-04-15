require 'rails_helper'

feature 'Admin register valid subsidiary' do
  scenario 'and cnpj must be unique' do
    Subsidiary.create!(name: 'Tatuapé', cnpj: '123', address: 'Rua Vilela')
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Tatuapé'
    fill_in 'cnpj', with: '123'
    fill_in 'Address', with: 'Rua Vilela'
    click_on 'Enviar'
    
    expect(Subsidiary.count).to eq 1
    expect(page).to have_content('CNPJ deve ser único')
  end

  scenario 'and cnpj cannot be blank' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Tatuapé'
    fill_in 'cnpj', with: ''
    fill_in 'Address', with: 'Rua Vilela'
    click_on 'Enviar'

    expect(page).to have_content('CNPJ não pode ficar em branco')
  end
end
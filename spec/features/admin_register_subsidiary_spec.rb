require 'rails_helper'

feature 'Admin register subsidiary' do
  scenario 'from index page' do
    visit root_path
    click_on 'Filiais'

    expect(page).to have_link('Registrar nova filial', href: new_subsidiary_path)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Tatuapé'
    fill_in 'CNPJ', with: '123'
    fill_in 'Endereço', with: 'Rua Vilela'
    click_on 'Enviar'

    expect(current_path).to eq subsidiary_path(Subsidiary.last.id)
    expect(page).to have_content('Tatuapé')
    expect(page).to have_content('123')
    expect(page).to have_content('Rua Vilela')
    expect(page).to have_link('Voltar')
  end
end
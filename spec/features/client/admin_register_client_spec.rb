require 'rails_helper'

feature 'Admin register customer' do
  scenario 'must be signed in' do
    # TODO Se eu coloco rentals_path passa, mas clients_path não.
    visit rentals_path
    expect(current_path).to eq new_user_session_path
  end

  scenario 'successfully' do
    # TODO erro no teste  undefined method `rentals'
    user = User.create!(email: 'joao@email.com', password: '12345678')
    login_as(user, scope: :user)
    
    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar Novo Cliente'

    fill_in 'Nome', with: 'Andre Silva'
    fill_in 'Documento', with: '57879450777'
    fill_in 'Email', with: 'andre@email.com'

    click_on 'Salvar'

    expect(page).to have_content('Andre Silva')
    expect(page).to have_content('Documento: 578.794.507-77')
    expect(page).to have_content('Email: andre@email.com')
  end

  scenario 'must fill in all fields' do
    user = User.create!(email: 'joao@email.com', password: '12345678')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar Novo Cliente'

    fill_in 'Nome', with: ''
    fill_in 'Documento', with: ''
    fill_in 'Email', with: ''

    click_on 'Salvar'

    expect(page).to have_content('Não foi possível cadastrar o novo cliente')
  end
end
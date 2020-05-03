require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'validate mandatory fields' do
    it 'should have a name' do
      sub = Client.new(name: '')

      result = sub.valid?

      expect(result).to eq false
      expect(sub.errors[:name]).to include 'não pode ficar em branco'
    end

    it 'should have an email' do
      sub = Client.new(email: '')

      result = sub.valid?

      expect(result).to eq false
      expect(sub.errors[:email]).to include 'não pode ficar em branco'
    end

    it 'should have a document' do
      sub = Client.new(document: '')

      result = sub.valid?

      expect(result).to eq false
      expect(sub.errors[:document]).to include 'não pode ficar em branco'
    end
  end

  describe 'validate unique fields' do
    it 'should have an unique email' do
      Client.create!(name: 'Joao Silva', document: '57879450777' , email: 'joao@email.com')

      client = Client.new(email: 'joao@email.com')

      result = client.valid?

      expect(result).to be false
      expect(client.errors[:email]).to include('já está em uso')
    end

    it 'should have an unique document' do
      Client.create(name: 'Joao Silva', document: '57879450777' , email: 'joao@email.com')

      client = Client.new(document: '57879450777')


      result = client.valid?

      expect(result).to be false
      expect(client.errors[:document]).to include('já está em uso')
    end
  end

  describe 'validate document rules' do
    it 'should have a valid CNPJ with 11 numbers' do
      client = Client.new(name: 'Joao Silva', document: '123',
                              email: 'joao@email.com')

      result = client.valid?

      expect(result).to be false
      expect(client.errors[:document]).to include('deve ter 11 números')
    end
    it 'should have a valid document' do
      client = Client.new(name: 'Joao Silva', document: '11111111111',
                              email: 'joao@email.com')

      result = client.valid?

      expect(result).to be false
      expect(client.errors[:document]).to include('não é válido')
    end
  end
end
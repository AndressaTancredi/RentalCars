require 'rails_helper'

RSpec.describe Subsidiary, type: :model do
  describe 'validate mandatory fields'
  it 'should have a name' do
    sub = Subsidiary.create(name: '', address: 'Rua Brasil', cnpj: '12345678912345')


    result = sub.valid?

    expect(result).to eq false
    expect(sub.errors[:name]).to include 'não pode ficar em branco'
    
  end

  it 'should have an address' do
    sub = Subsidiary.create(name: 'Paulista', address: '', cnpj: '12345678912345')


    result = sub.valid?

    expect(result).to eq false
    expect(sub.errors[:address]).to include 'não pode ficar em branco'
  end

  it 'should have a CNPJ' do
    sub = Subsidiary.create(name: 'Paulista', address: 'Rua Brasil', cnpj: '')

    result = sub.valid?

    expect(result).to eq false
    expect(sub.errors[:cnpj]).to include 'não pode ficar em branco'
  end

  describe 'validate unique fields' do
    it 'should have an unique name' do

      Subsidiary.create!(name: 'Paulista', address: 'Rua Brasil', cnpj: '85498967000106')
      sub = Subsidiary.new(name: 'Paulista', address: 'Rua Brasil2', cnpj: '45025724000128')

      result = sub.valid?

      expect(result).to be_falsy
      expect(sub.errors[:name]).to include('já está em uso')
    end

    it 'should have an unique address' do
      Subsidiary.create(name: 'Paulista', address: 'Rua Brasil', cnpj: '85498967000106')
      sub = Subsidiary.create(name: 'Paulista2', address: 'Rua Brasil', cnpj: '45025724000128')

      result = sub.valid?

      expect(result).to be_falsy
      expect(sub.errors[:address]).to include('já está em uso')
    end
  end

  describe 'validate CNPJ rules' do
    it  'should have a valid cnpj with 14 numbers' do
      sub = Subsidiary.create(name: 'Paulista', address: 'Rua Brasil', cnpj: '123')

      result = sub.valid?

      expect(result).to be_falsy
      expect(sub.errors[:cnpj]).to include('deve ter 14 números')
    end

    it  'should have a valid cnpj' do
      sub = Subsidiary.create(name: 'Paulista', address: 'Rua Brasil', cnpj: '12345678912345')

      result = sub.valid?

      expect(result).to be false
      expect(sub.errors[:cnpj]).to include('não é válido')
    end

  end
end
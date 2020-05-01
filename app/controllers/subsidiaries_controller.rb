class SubsidiariesController < ApplicationController

  before_action :set_subsidiary, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @subsidiaries = Subsidiary.all

  end

  def show
  end

  #Para exibir o form - É o resultado do create?
  def new
    @subsidiary = Subsidiary.new
  end

  def create
    @subsidiary = Subsidiary.new(subsidiary_params)

    if @subsidiary.save
      redirect_to @subsidiary
    else
      render :new
    end

  end  
  
  private

  def subsidiary_params
    params.require(:subsidiary).permit(:name, :address, :cnpj)
    # Usando o permit por segurança - https://guides.rubyonrails.org/action_controller_overview.html#strong-parameters 
  end

  def set_subsidiary
    @subsidiary = Subsidiary.find(params[:id])
  end  

end
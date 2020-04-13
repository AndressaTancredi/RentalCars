class SubsidiariesController < ApplicationController
  before_action :set_subsidiary, only: [:show, :edit, :update, :destroy]

  def index
    @subsidiaries = Subsidiary.all

  end

  def show
  end

  
  private

  def subsidiary_params
    params.require(:subsidiary).permit(:name)
    # Usando o permit por segurança - https://guides.rubyonrails.org/action_controller_overview.html#strong-parameters 
  end

  def set_subsidiary
    @subsidiary = Subsidiary.find(params[:id])
  end  

end
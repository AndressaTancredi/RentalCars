class ManufacturersController < ApplicationController

  before_action :set_manufacturer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @manufacturers = Manufacturer.all
  end

  def show
  end

  # Find já tennho o id;
  # Find_by(name:"Fiat") Só devolve o primeiro elemento (não uma lista);
  # Where(name:"Fiat") igual ao find_by mas devolve uma lista.

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    
    if @manufacturer.save

      # Toda rota que não é get, precisa redirecionar.
      redirect_to @manufacturer # To mandando um obj ao invéz de um path/url.
    else
      # Chama a view com o nome :new 
      render :new
    end
  end

  def update
    if @manufacturer.update(manufacturer_params)
      redirect_to @manufacturer
    else
      render 'edit'  
    end  
  end

  def destroy
    @manufacturer.delete
    redirect_to manufacturers_path
  end

  def edit
  end  

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
    # Usando o permit por segurança - https://guides.rubyonrails.org/action_controller_overview.html#strong-parameters 
  end

  def set_manufacturer
    @manufacturer = Manufacturer.find(params[:id])
  end  

end
class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  # Find já tennho o id;
  # Find_by(name:"Fiat") Só devolve o primeiro elemento (não uma lista);
  # Where(name:"Fiat") igual ao find_by mas devolve uma lista.

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    name = params[:manufacturer][:name]
    @manufacturer = Manufacturer.new
    @manufacturer.name = name
    if @manufacturer.save

      # Toda rota que não é get, precisa redirecionar.
      redirect_to @manufacturer # To mandando um obj ao invéz de um path/url.
    else
      # Chama a view com o nome :new 
      render :new
    end

  end

  def update
  end
end
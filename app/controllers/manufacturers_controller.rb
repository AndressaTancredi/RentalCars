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
end
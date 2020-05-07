class RentalsController < ApplicationController

  # Se n tiver user logado redireciona automaticamente pra tela de login.
  before_action :authenticate_user!

  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
    @car_categories = CarCategory.all
    @clients = Client.all
  end

  def create
    @rental = Rental.new(params.require(:rental).permit(:start_date, :end_date, :car_category_id, :client_id))
    if @rental.save
      # Flash sempre acompanha um redirect
      flash[:success] = 'Locação cadastrada com sucesso'
      redirect_to rentals_path
    else
      @car_categories = CarCategory.all
      @clients = Client.all
      render:new
    end
  end

  def search
    # Pensando como regra de negócio esse método poderia estar na model (scope ou método de classe)
    @rentals = Rental.where(code: params[:q])
    render :index
  end
end
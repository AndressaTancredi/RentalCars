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

  def start
    @rental = Rental.find(params[:id])
    car_models = @rental.car_category.car_models # Array de modelos de carro
    @available_cars = Car.where(car_model: car_models)
  end

  def confirm
    @rental = Rental.find(params[:id])
    @car = Car.find(params[:car_id])
    @user = current_user

    begin # Tratamento de erro do rescue para o transaction: usando pq o bloco todo deve passar pelo banco, se não entra na rescue.
      ActiveRecord::Base.transaction do
        # @rental.update(status: :ongoing) Mesma coisa que abaixo:
        @rental.ongoing!
        @car.rented!       
        # Model novo criado para lembrar qual a tarifa na época
        CarRental.create!(rental:@rental, car: @car, start_date: Time.zone.now, 
                        user: @user, daily_rate: @rental.car_category.daily_rate, 
                        car_insurance: @rental.car_category.car_insurance, 
                        third_part_insurance: @rental.car_category.third_part_insurance)
      end
      rescue
        logger.error "#{@rental.code} - Não foi possível iniciar a locação"
      end
    redirect_to @rental
  end  


  def show
    @rental = Rental.find(params[:id])
  end
end
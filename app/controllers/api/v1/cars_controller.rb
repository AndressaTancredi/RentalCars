class Api::V1::CarsController < Api::V1::ApiController 
  def index
    render json: Car.available, status: :ok
    #TODO porque passamos o status ok aqui?
  end

  def show
    car = Car.find(params[:id])
    render json: car
  end

  def create
    @car = Car.create!(car_params)
    render json: @car, status: :created

  rescue ActionController::ParameterMissing
    render json: I18n.t('errors.messages.missing_parameters'), 
           status: :precondition_failed
  end

  private

  def car_params
    params.require(:car).permit(:license_plate, :color, :car_model_id, :mileage)
  end
end
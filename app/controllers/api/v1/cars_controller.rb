class Api::V1::CarsController < Api::V1::ApiController 
  def index
    render json: Car.available, status: :ok
    #TODO porque passamos o status ok aqui?
  end

  def show
    car = Car.find(params[:id])
    render json: car

  rescue ActiveRecord::RecordNotFound
      render json: 'Carro não encontrado', status: :not_found    
  end
end
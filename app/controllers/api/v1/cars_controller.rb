class Api::V1::CarsController < Api::V1::ApiController 
  def index
    render json: Car.available, status: :ok
    #TODO porque passamos o status ok aqui?
  end
end
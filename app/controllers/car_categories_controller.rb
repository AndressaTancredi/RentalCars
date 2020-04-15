class CarCategoriesController < ApplicationController

  def show
      @car_category = CarCategory.find(params[:id])
  end

  def new
    @car_category = CarCategory.new
  end

  def create # Não é um get então não tem um view automaticamente, precisa redirecionar
    car_category_params = params.require(:car_category)
                                .permit(:name, :daily_rate, 
                                        :car_insurance, 
                                        :third_part_insurance)
    @car_category = CarCategory.new(car_category_params)
    @car_category.save

    redirect_to @car_category
  end

end
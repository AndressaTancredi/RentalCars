class ClientsController < ApplicationController

  def index

  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    client_params = params.require(:client).permit(:name, :document, :email)
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client
    else
      render :new
    end
  end

  def search
    # Sintaxe do SQL para evitar uma SQL injection, alguém que use esse imput para por ex. deletar seu BD
    @search_query = params[:query]
    @clients = Client.where("name LIKE ?", "%#{params[:query]}%")
                     .or(Client.where(document: @search_query))
  end 
end
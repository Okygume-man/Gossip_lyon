class CitiesController < ApplicationController
  def index
    @city = City.all
  end

  def show
    @gossips = Gossip.all
    @city = City.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

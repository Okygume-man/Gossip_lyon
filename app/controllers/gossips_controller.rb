class GossipsController < ApplicationController
  def index
  	@gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

    def create
    @city = City.create(name: params[:city_name])
    @user = User.create(first_name: params[:gossip_user], city_id: @city.id)
    @gossip = Gossip.create(content: params[:gossip_content], user_id: @user.id, title: params[:gossip_title])

    if @gossip.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to :gossips
    else
      flash[:danger] = "NOPE TU AS TORT"
      render :new
    end

  end
  def show
    @gossip = Gossip.find(params[:id])
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(post_params)
      redirect_to @gossip
      flash[:success] = "The gossips has been update succefully."
    else
      flash[:danger] = "An error has happened, try again."
      render :edit
      end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  private

  def post_params
    params.require(:gossip).permit(:title, :content)
  end
end

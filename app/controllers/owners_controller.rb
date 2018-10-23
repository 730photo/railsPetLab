class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    owner = Owner.create!(owner_params)
    redirect_to "/owners/#{@owner.id}"
  end

  def show
    owner_id = params[:id]
    @owner = Owner.find_by(id: owner_id)
  end

  def edit
    # stretch
  end

  def update
    @owner = Owner.find_by( id: params[:id])
    @owner.update(owner_params)
    redirect_to "/owners/#{@owner.id}"
  end

  def destroy
    @owner = Owner.find(params[:id])
    @owner.destroy
    redirect_to artists_path
  end


  private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :phone)
  end

end

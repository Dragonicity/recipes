class ChefsController < ApplicationController

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)

    if @chef.save
      flash[:success] = "Chef was created registered"
      redirect_to recipes_path
    else
      render :new
    end

  end

  def edit

  end

  def update

  end

  private

    def chef_params
      params.require(:chef).permit(:name, :email, :password)
    end

end
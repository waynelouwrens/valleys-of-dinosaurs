class DinosaursController < ApplicationController

  def index
    @dinosaurs = Dinosaur.all
  end

  def show
    @dinosaur = Dinosaur.find(params[:id])
  end

  def new
    @dinosaur = Dinosaur.new
  end

  def create
    @dinosaur = Dinosaur.new(dinosaur_params)

    if @dinosaur.save
      redirect_to @dinosaur
    else
      render 'new'
    end
  end

  private

  def dinosaur_params
    dinosaur_params = params.require(:dinosaur).permit(:name, :age, :image_url)
  end


end

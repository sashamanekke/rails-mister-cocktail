class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  def new
    @ingredients = Ingredient.all
    @dose = Dose.new
  end
  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      @ingredients = Ingredient.all
      render "doses/new"
    end
  end
  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end

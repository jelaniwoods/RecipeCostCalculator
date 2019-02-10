# frozen_string_literal: true

class ShoplistIngredientsController < ApplicationController
  before_action :set_shoplist_ingredient, only: %i[show edit update destroy]

  # GET /shoplist_ingredients
  def index
    @shoplist_ingredients = ShoplistIngredient.all
  end

  # GET /shoplist_ingredients/1
  def show; end

  # GET /shoplist_ingredients/new
  def new
    @shoplist_ingredient = ShoplistIngredient.new
  end

  # GET /shoplist_ingredients/1/edit
  def edit; end

  # POST /shoplist_ingredients
  def create
    @shoplist_ingredient = ShoplistIngredient.new(shoplist_ingredient_params)

    if @shoplist_ingredient.save
      redirect_to @shoplist_ingredient, notice: 'Shoplist ingredient was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /shoplist_ingredients/1
  def update
    if @shoplist_ingredient.update(shoplist_ingredient_params)
      redirect_to @shoplist_ingredient, notice: 'Shoplist ingredient was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /shoplist_ingredients/1
  def destroy
    @shoplist_ingredient.destroy
    redirect_to shoplist_ingredients_url, notice: 'Shoplist ingredient was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shoplist_ingredient
    @shoplist_ingredient = ShoplistIngredient.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def shoplist_ingredient_params
    params.require(:shoplist_ingredient).permit(:shoplist_id, :price, :name, :units, :quantity)
  end
end

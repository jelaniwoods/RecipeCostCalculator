# frozen_string_literal: true

class ShoplistsController < ApplicationController
  before_action :set_shoplist, only: %i[show edit update destroy]

  # GET /shoplists
  def index
    @shoplists = Shoplist.all
  end

  # GET /shoplists/1
  def show; end

  # GET /shoplists/new
  def new
    @shoplist = Shoplist.new
  end

  # GET /shoplists/1/edit
  def edit; end

  # POST /shoplists
  def create
    @shoplist = Shoplist.new(shoplist_params)

    if @shoplist.save
      redirect_to @shoplist, notice: 'Shoplist was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /shoplists/1
  def update
    if @shoplist.update(shoplist_params)
      redirect_to @shoplist, notice: 'Shoplist was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /shoplists/1
  def destroy
    @shoplist.destroy
    redirect_to shoplists_url, notice: 'Shoplist was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shoplist
    @shoplist = Shoplist.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def shoplist_params
    params.require(:shoplist).permit(:recipe_id, :name)
  end
end

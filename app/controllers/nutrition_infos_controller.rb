class NutritionInfosController < ApplicationController
  before_filter :admin_filter
  skip_before_filter :admin_filter, :only => [:show]
  # GET /nutrition_infos
  # GET /nutrition_infos.json
  def index
    @nutrition_infos = NutritionInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nutrition_infos }
    end
  end

  # GET /nutrition_infos/1
  # GET /nutrition_infos/1.json
  def show
    @nutrition_info = NutritionInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nutrition_info }
    end
  end

  # GET /nutrition_infos/new
  # GET /nutrition_infos/new.json
  def new
    @nutrition_info = NutritionInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nutrition_info }
    end
  end

  # GET /nutrition_infos/1/edit
  def edit
    @nutrition_info = NutritionInfo.find(params[:id])
  end

  # POST /nutrition_infos
  # POST /nutrition_infos.json
  def create
    @nutrition_info = NutritionInfo.new(params[:nutrition_info])

    respond_to do |format|
      if @nutrition_info.save
        format.html { redirect_to @nutrition_info, notice: 'Nutrition info was successfully created.' }
        format.json { render json: @nutrition_info, status: :created, location: @nutrition_info }
      else
        format.html { render action: "new" }
        format.json { render json: @nutrition_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nutrition_infos/1
  # PUT /nutrition_infos/1.json
  def update
    @nutrition_info = NutritionInfo.find(params[:id])

    respond_to do |format|
      if @nutrition_info.update_attributes(params[:nutrition_info])
        format.html { redirect_to @nutrition_info, notice: 'Nutrition info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nutrition_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nutrition_infos/1
  # DELETE /nutrition_infos/1.json
  def destroy
    @nutrition_info = NutritionInfo.find(params[:id])
    @nutrition_info.destroy

    respond_to do |format|
      format.html { redirect_to nutrition_infos_url }
      format.json { head :no_content }
    end
  end
end

class MenusController < ApplicationController
  before_filter :admin_filter
  skip_before_filter :admin_filter, :only => [:show]
  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @menus }
    end
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    @menu = Menu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @menu }
    end
  end

  # GET /menus/new
  # GET /menus/new.json
  def new
    @menu = Menu.new

    @salads =  Recipe.where("category = ?", "Salad").all
    @full_meals = Recipe.where("category != ?", "Salad").all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @menu }
    end
  end

  def get_salads
    salads = []
    temp_salads = InventoryItem.where("category = ?", "Salad").all
    if !temp_salads.empty?
      temp_salads.each do |item|
        salads << Recipe.find(item.recipe_id)
      end
    end

    return salads
  end
  def get_full_meals
    temp_meals = InventoryItem.where("category = ? OR category = ?", "Full Meal", "Soup").all
    full_meals = []
    if !temp_meals.empty?
      temp_meals.each do |item|
        full_meals << Recipe.find(item.recipe_id)
      end
    end

    return full_meals
  end

  # GET /menus/1/edit
  def edit
    @menu = Menu.find(params[:id])
    @salads =  Recipe.where("category = ?", "Salad").all
    @full_meals = Recipe.where("category != ?", "Salad").all

  end
  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(params[:menu])

    @salads =  Recipe.where("category = ?", "Salad").all
    @full_meals = Recipe.where("category != ?", "Salad").all

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
        format.json { render json: @menu, status: :created, location: @menu }
      else
        format.html { render action: "new" }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /menus/1
  # PUT /menus/1.json
  def update
    @menu = Menu.find(params[:id])
    @salads =  Recipe.where("category = ?", "Salad").all
    @full_meals = Recipe.where("category != ?", "Salad").all

    respond_to do |format|
      if @menu.update_attributes(params[:menu])
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to menus_url }
      format.json { head :no_content }
    end
  end
end

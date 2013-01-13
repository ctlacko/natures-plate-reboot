class RecipesController < ApplicationController
  before_filter :admin_filter
  skip_before_filter :admin_filter, :only => [:show, :index]
  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
    @soups = []
    @full_meals = []

    temp_soups = InventoryItem.where("category = ?", "Soup").all
    if !temp_soups.empty?
      temp_soups.each do |item|
        @soups << Recipe.find(item.recipe_id)
      end
    end

    temp_meals = InventoryItem.where("category = ?", "Full Meal").all
    if !temp_meals.empty?
      temp_meals.each do |item|
        @full_meals << Recipe.find(item.recipe_id)
      end
    end

    # setup our current_menus
    # -----------------------
    #
    # Used in view layer
    #
    # The way this works currently, a recipe could be displayed
    # both as a salad and an entree

    @current_menus = Menu.where("start_date <= ? AND end_date >= ?", Date.today, Date.today).first
    puts "current_menu: "
    puts @current_menus
    temp_entrees = []
    temp_salads = []

    @menu_entrees = []
    @menu_salads = []

    if @current_menus
      # iterate on recipe_ids
      @current_menus.recipe_ids.each do |recipe_id|
        # use recipe_id to look up recipe
        temp_recipe = Recipe.where("id = ?", recipe_id).first
        # iterate on inventory items of that recipe
        temp_recipe.inventory_items.each do |inventory_item|
          if inventory_item.category == "Salad"
            temp_salads << temp_recipe
          else
            temp_entrees << temp_recipe
          end
        end
      end
      # save temp values into member scoped arrays
      @menu_entrees = temp_entrees 
      @menu_salads = temp_salads
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @nutrition_info = NutritionInfo.where( "recipe_id = ?", @recipe.id ).first
    @inventory_items = []
    @recipe.inventory_items.each do |inventory_item|
      @inventory_items << inventory_item
    end


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipe }
    end
  end

  #def build_nutrition_info
  #@recipe.nutrition_info_attributes = params[:nutrition_infos]
  #end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new
    @recipe.build_nutrition_info

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(params[:recipe])

    respond_to do |format|
      if @recipe.save 
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end
end

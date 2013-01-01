class RecipesController < ApplicationController
  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all

    @soups = Recipe.where("category = ?", "Soup")
    @full_meals = Recipe.where("category = ?", "Full Meal")
    @current_menus = Menu.where("start_date >= ? AND end_date <= ?", Date.today, Date.today).first
    temp_entrees = []
    temp_salads = []

    @current_menus.recipe_ids.each_with_index do |recipe_id, index|
      # grab recipes, split on category
      temp_salad = Recipe.where("id = ? AND category != ?", recipe_id, "Salad").all
      temp_entree = Recipe.where("id = ? AND category != ?", recipe_id, "Salad").all
      # push recipes onto temporary arrays
      temp_entrees << temp_entree if !temp_entree.empty?
      temp_salads << temp_salad if !temp_salad.empty?
    end
    # save temp values into member scope arrays
    @menu_entrees = temp_entrees 
    @menu_salads = temp_salads

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
    @sizes = Recipe.select(:size).uniq
    @categorys = Recipe.select(:category).uniq
    @recipe.build_nutrition_info

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
    @size = params[:size]
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

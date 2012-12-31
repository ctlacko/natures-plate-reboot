class RecipesController < ApplicationController
  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all

    @soups = Recipe.where("category = ?", "Soup")
    @full_meals = Recipe.where("category = ?", "Full Meal")
    @current_menus = Menu.find(1) #where("is_active = ?", true)
    @temp_entrees = []
    @temp_salads = []

    if @current_menus.is_a?(Hash)
      @current_menus.each do |current_menu|
        # build up @menu_entrees and @menu_salads objects
        # with all recipes related to this menu
        # they will be referenced by menu_id
        # the final objects will look like this
        #
        # @menu_entrees[menu_id] = { recipe_id => recipe_attributes }
        current_menu.recipe_ids.each do |recipe_id|
          @temp_entrees[recipe_id] = Recipe.where("id = ? AND category != ?", recipe_id, "Salad").all
          @temp_salads[recipe_id] = Recipe.where("id = ? AND category = ?", recipe_id, "Salad").all
        end
        @menu_entrees[current_menu.id] = @temp_entrees 
        @menu_salads[current_menu.id] = @temp_salads
      end
    else
      @current_menus.recipe_ids.each do |recipe_id|
        # use .all to "commit" the query
        if !Recipe.where("id = ? AND category != ?", recipe_id, "Salad").empty? 
          @temp_entrees[recipe_id] = Recipe.where("id = ? AND category != ?", recipe_id, "Salad").all
        end
        if !Recipe.where("id = ? AND category = ?", recipe_id, "Salad").empty? 
          @temp_salads[recipe_id] = Recipe.where("id = ? AND category != ?", recipe_id, "Salad").all
        end
      end
      @menu_entrees = @temp_entrees 
      @menu_salads = @temp_salads
      puts @menu_entrees
      puts @menu_salads
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

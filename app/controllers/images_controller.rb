class ImagesController < ApplicationController
  before_filter :admin_filter
  skip_before_filter :admin_filter, :only => [:show, :show_style]

  def index
    @images = Image.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @home_posts }
    end
  end
  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html
    end
  end
  def show_style
    @image_reference = Recipe.find(params[:recipe_id])
    @image = @image_reference.image_reference
    @style = params[:style]
  end

  def new
    @image = Image.new
  end

  def create
    begin
      @image = Image.create(params[:image])
      redirect_to images_url, notice: "Uploaded successfully!"
    rescue => e 
      puts e
      alert = "There was an error uploading that image. It was either too large or in the wrong format. Images must be < 5 MB and in either JPEG or GIF format."
      redirect_to images_url, notice: alert
    end

  end

  def edit
    @image = Image.find(params[:id])
  end
end

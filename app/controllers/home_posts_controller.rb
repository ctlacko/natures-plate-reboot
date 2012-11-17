class HomePostsController < ApplicationController
  # GET /home_posts
  # GET /home_posts.json
  def index
    @home_posts = HomePost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @home_posts }
    end
  end

  # GET /home_posts/1
  # GET /home_posts/1.json
  def show
    @home_post = HomePost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @home_post }
    end
  end

  # GET /home_posts/new
  # GET /home_posts/new.json
  def new
    @home_post = HomePost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @home_post }
    end
  end

  # GET /home_posts/1/edit
  def edit
    @home_post = HomePost.find(params[:id])
  end

  # POST /home_posts
  # POST /home_posts.json
  def create
    @home_post = HomePost.new(params[:home_post])

    respond_to do |format|
      if @home_post.save
        format.html { redirect_to @home_post, notice: 'Home post was successfully created.' }
        format.json { render json: @home_post, status: :created, location: @home_post }
      else
        format.html { render action: "new" }
        format.json { render json: @home_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /home_posts/1
  # PUT /home_posts/1.json
  def update
    @home_post = HomePost.find(params[:id])

    respond_to do |format|
      if @home_post.update_attributes(params[:home_post])
        format.html { redirect_to @home_post, notice: 'Home post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @home_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /home_posts/1
  # DELETE /home_posts/1.json
  def destroy
    @home_post = HomePost.find(params[:id])
    @home_post.destroy

    respond_to do |format|
      format.html { redirect_to home_posts_url }
      format.json { head :no_content }
    end
  end
end

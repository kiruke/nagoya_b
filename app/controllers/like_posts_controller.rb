class LikePostsController < ApplicationController
  before_action :set_like_post, only: %i[ show edit update destroy ]

  # GET /like_posts or /like_posts.json
  def index
    @like_posts = LikePost.all
  end

  # GET /like_posts/1 or /like_posts/1.json
  def show
  end

  # GET /like_posts/new
  def new
    @like_post = LikePost.new
  end

  # GET /like_posts/1/edit
  def edit
  end

  # POST /like_posts or /like_posts.json
  def create
    @like_post = LikePost.new(like_post_params)

    respond_to do |format|
      if @like_post.save
        format.html { redirect_to like_post_url(@like_post), notice: "Like post was successfully created." }
        format.json { render :show, status: :created, location: @like_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @like_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /like_posts/1 or /like_posts/1.json
  def update
    respond_to do |format|
      if @like_post.update(like_post_params)
        format.html { redirect_to like_post_url(@like_post), notice: "Like post was successfully updated." }
        format.json { render :show, status: :ok, location: @like_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @like_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /like_posts/1 or /like_posts/1.json
  def destroy
    @like_post.destroy

    respond_to do |format|
      format.html { redirect_to like_posts_url, notice: "Like post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like_post
      @like_post = LikePost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_post_params
      params.require(:like_post).permit(:user_id, :post_id)
    end
end

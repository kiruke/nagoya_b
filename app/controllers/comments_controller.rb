class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  # before_action :require_login

  # GET /comments or /comments.json
  # def index
  #   @comments = Comment.all
  # end

  # GET /comments/1 or /comments/1.json
  # def show
  # end

  # GET /comments/new
  # def new
  #   @comment = Comment.new
  # end

  # GET /comments/1/edit
  # def edit
  # end

  # POST /comments or /comments.json
  def create
    # byebug
    # @comment = current_user.comments.build(comment_params)
    # puts @comment.body
    # byebug
    # @comment.save

    comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to post_path(comment.post), success: 'コメントを登録しました'
    else
      redirect_to post_path(comment.post), danger: 'コメントの登録に失敗しました'
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  # def update
  #   respond_to do |format|
  #     if @comment.update(comment_params)
  #       format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
  #       format.json { render :show, status: :ok, location: @comment }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @comment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body).merge(post_id: params[:post_id])
    end
end

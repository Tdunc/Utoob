class CommentsController < ApplicationController
  before_action: :set_sub
  before_action: :set_comment, only: [:show, :edit, :destroy, :update]
  def index
    @comment = current_user.comments
  end

  def show
  end

  def new
    @comment = current_user.comments.new
  end

  def create
    @comment = current_user.comment.new(comment_params)
    if @comment.save
      redirect_to [@movie, @comment] #psudo route
    else
      render :new
    end
  end

  def edit
    #
  end

  def update
    if @comment.update(comment_params)
      redirect_to [@movie, @comment]
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to movie_comments_path # may need to update route
end

private
def set_movie
 @movie = Movie.find(params[:movie_id]) 
end

def set_comment
  @comment = Comment.find(params[:id])
end

def comment_params
  params.require(:comment).permit(:user_id, :body)
end

end #class end

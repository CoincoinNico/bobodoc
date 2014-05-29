 class CommentsController < ApplicationController
  before_action :find_commentable

  def create
    # Not implemented: check to see whether the user has permission to create a comment on this object
    @commentable = find_commentable
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to find_commentable_url(find_commentable), notice: "The comment has been successfully created."
      # render :partial => "comments/comment", :layout => false, :status => :created
    else
      render :js => "alert('error saving comment');"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :json => @comment, :status => :ok
    else
      render :js => "alert('error deleting comment');"
    end
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:title, :comment, :commentable_id, :commentable_type, :user_id, :role)
    end

    def find_commentable
      if params[:medicament_id]
        id = params[:medicament_id]
        Medicament.find(params[:medicament_id])
      elsif params[:drugstore_id]
        id = params[:drugstore_id]
        Drugstore.find(params[:drugstore_id])
      end
    end

    def find_commentable_url(commentable)
      if Medicament === commentable
        medicament_path(commentable)
      elsif Drugstore === commentable
        drugstore_path(commentable)
      end
    end
end
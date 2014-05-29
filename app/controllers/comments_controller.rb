 class CommentsController < ApplicationController
  before_action :find_commentable

  def create
    # Not implemented: check to see whether the user has permission to create a comment on this object
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    unless @comment.save
      render :js => "alert('error saving comment');"
    end
      # render :partial => "comments/comment", :layout => false, :status => :created
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
      if params[:comment][:medicament_id]
        @commentable = Medicament.find(params[:comment][:medicament_id])
      elsif params[:comment][:drugstore_id]
        @commentable = Drugstore.find(params[:comment][:drugstore_id])
      end
    end
end
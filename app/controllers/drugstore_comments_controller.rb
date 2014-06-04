class DrugstoreCommentsController < InheritedResources::Base
  before_filter :authenticate_user!

  def create
    # Not implemented: check to see whether the user has permission to create a comment on this object
    @comment = DrugstoreComment.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to drugstore_path(params[:drugstore_comment][:drugstore_id])
      # render :js => "alert('error saving comment');"
    end
      # render :partial => "comments/comment", :layout => false, :status => :created
  end

 private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:drugstore_comment).permit(:title, :review, :user_id, :drugstore_id)
    end
end

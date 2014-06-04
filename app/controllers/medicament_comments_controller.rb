class MedicamentCommentsController < InheritedResources::Base
  before_filter :authenticate_user!, only: [:create]

  def create
    # Not implemented: check to see whether the user has permission to create a comment on this object
    @comment = MedicamentComment.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to medicament_path(params[:medicament_comment][:medicament_id])
      # render :js => "alert('error saving comment');"
    end
      # render :partial => "comments/comment", :layout => false, :status => :created
  end

 private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:medicament_comment).permit(:title, :review, :user_id, :medicament_id)
    end
end

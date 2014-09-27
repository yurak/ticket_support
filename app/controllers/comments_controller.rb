class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_ticket
  respond_to :html, :json, :xml

  def new
    @comment = Comment.new
  end

  def create
    @comment = @ticket.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    respond_with @ticket
  end

  def destroy
    @comment = @ticket.comments.find(params[:id])
    @comment.destroy
    respond_with @ticket
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_ticket
      @ticket = Ticket.find_by_identifier(params[:ticket_id])
    end

    def comment_params
      params.require(:comment).permit(:body,:ticket_id, :user_id)
    end
end

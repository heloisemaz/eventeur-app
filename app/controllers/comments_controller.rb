class CommentsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @event = Event.find(params[:event_id])
    @comment.event = @event
    if @comment.save
      redirect_to event_path(@event)
    else 
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :message)
  end
end

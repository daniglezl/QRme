class ForumThreadsController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'

  def new
    event = Event.find(params[:event_id])
    @forum_thread = event.forum_threads.build
  end

  def create
    event = Event.find(params[:event_id])
    @forum_thread = event.forum_threads.build forum_thread_params
    @forum_thread.save
    @event = Event.find(params[:event_id])
  end

  def show
    @forum_thread = ForumThread.find(params[:id])
  end

  def edit
    @forum_thread = ForumThread.find(params[:id])
  end

  def update
    @forum_thread = ForumThread.find(params[:id])
    @forum_thread.update_attributes(forum_thread_params)
    @event = @forum_thread.event
  end

  def destroy
    @forum_thread = ForumThread.find(params[:id])
    @event = @forum_thread.event
    @forum_thread.destroy
  end

  private

  def forum_thread_params
    params.require(:forum_thread).permit(:title)
  end

end

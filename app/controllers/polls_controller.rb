class PollsController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
  
  def new
    event = Event.find(params[:event_id])
    @poll = event.polls.build
  end
  
  def create
    event = Event.find(params[:event_id])
    @poll = event.polls.build poll_params
    @poll.save
    @event = Event.find(params[:event_id])
  end

  def show
    @poll = Poll.find(params[:id])
  end

  def edit
    @poll = Poll.find(params[:id])
  end

  def update
    @poll = Poll.find(params[:id])
    @poll.update_attributes(poll_params)
    @event = @poll.event
  end

  def destroy
    @poll = Poll.find(params[:id])
    @event = @poll.event
    @poll.destroy
  end

  private
  def poll_params
    params.require(:poll).permit(:name)
  end

end

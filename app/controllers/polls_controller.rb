class PollsController < ApplicationController

  def new
    event = Event.find(params[:event_id])
    @poll = event.polls.build
  end

end

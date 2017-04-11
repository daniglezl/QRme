module Api
  module V1

    class EventsController < ApplicationController

      def index
        @events = User.find(params[:user_id]).events.includes(:event_instances)
      end

      def invite
        event = Event.find(params[:id])
        inv = event.invitations.build(user_id: params[:user_id])
        inv.save
        # send email
        head :ok
      end

    end

  end
end

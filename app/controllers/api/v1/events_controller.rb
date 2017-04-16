module Api
  module V1

    class EventsController < ApplicationController

      def index
        @events = User.find(params[:user_id]).events.includes(:event_instances)
      end

      def invite
        event = Event.find_by(id: params[:id])
        if event.blank? || !event.open
          render json: { status: "Bad Request", error: "Event not found" }, status: 400 and return
        end
        if event.invitations.where(user_id: params[:user_id]).count > 0
          render json: { status: "Bad Request", error: "You are already invited" }, status: 400 and return
        end
        inv = event.invitations.build(user_id: params[:user_id])
        inv.save
        # send email
        render json: { status: "ok" }, status: :ok
      end

    end

  end
end

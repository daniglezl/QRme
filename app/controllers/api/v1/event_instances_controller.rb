module Api
  module V1

    class EventInstancesController < ApplicationController

      def mark_present
        event_instance = EventInstance.find(params[:id])
        if User.where(id: params[:user_id]).count < 1
          render json: { status: "Bad Request", error: "User not found" }, status: 400 and return
        end
        if event_instance.attendances.where(user_id: params[:user_id]).count > 0
          render json: { status: "Bad Request", error: "User already present" }, status: 400 and return
        end
        if event_instance.event.invitations.where(user_id: params[:user_id]).count < 1
          render json: { status: "Bad Request", error: "User not invited" }, status: 400 and return
        end
        att = event_instance.attendances.build(user_id: params[:user_id])
        att.save
        # send email
        render json: { status: "ok" }, status: :ok
      end

    end

  end
end

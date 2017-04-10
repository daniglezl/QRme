module Api
  module V1

    class EventInstancesController < ApplicationController

      def mark_present
        event_instance = EventInstance.find(params[:id])
        att = event_instance.attendances.build(user_id: params[:user_id])
        att.save
        # send email
        head :ok
      end

    end

  end
end

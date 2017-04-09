module Api
  module V1

    class EventsController < ApplicationController
      before_action :authenticate_user

      def index
        @events = knock_current_user.events.includes(:event_instances)
      end

    end

  end
end

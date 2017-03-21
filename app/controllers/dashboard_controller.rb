class DashboardController < ApplicationController
  before_action :authenticate_user!
  include EventsConcern
  layout 'dashboard'

  def index
    get_event_instances
  end

end

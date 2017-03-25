class AttendancesController < ApplicationController
     before_action :authenticate_user!
  layout 'dashboard'
  include EventsConcern


  def edit
    @event = Event.find(params[:id])
  #  @attendance = Attendance.find(params[:id])
   
  end

 
  private

  def attendance_params
    params.require(:event).permit(:user_id, :event_instance_id)
  end
end

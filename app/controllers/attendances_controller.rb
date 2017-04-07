class AttendancesController < ApplicationController
     before_action :authenticate_user!
  layout 'dashboard'
  include EventsConcern


  def edit
    @event_instance = EventInstance.find(params[:id])
  #  @attendance = Attendance.find(params[:id])
   
  end
  def attended
   
    event_instance = EventInstance.find(params[:event_instance])
    if params[:checked]=="true"
     event_instance.attendances.create(:user_id=> params[:userid])
    else
       event_instance.attendances.where(user_id: params[:userid]).destroy_all
    end
    
  end
  
  def doneattendance
     @event =Event.find(params[:id])
  end
  
  private

  def attendance_params
    params.require(:event).permit(:user_id, :event_instance_id)
  end
end

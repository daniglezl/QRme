class AttachmentsController < ApplicationController
    
    def new
        @event = Event.find(params[:event_id])
        @attachment = @event.attachments.build
    end
    
    def create
        @event = Event.find(params[:event_id])
        @attachment.save
    end
    
    def destroy
        @attachment = Attachment.find(params[:id])
        @event = @attachment.event
        @attachment.destroy
    end
    
end

class AttachmentsController < ApplicationController
    layout 'dashboard'
    include AttachmentsConcern
    
    def new
        event = Event.find(params[:event_id])
        @attachment = event.attachments.build
        # @attachment = @event.attachments.new
    end
    
    def create
        event = Event.find(params[:event_id])
        @attachment = event.attachments.build attachment_params
        #@attachment = @event.attachments.new(attachment_params)
        @attachment.save
        @event = Event.find(params[:event_id])
    end
    
    def destroy
        @attachment = Attachment.find(params[:id])
        @event = @attachment.event
        @attachment.destroy
        get_attachments
    end
    
    private
        def attachment_params
        params.require(:attachment).permit(:name, :file)
        end
end

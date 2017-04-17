class AttachmentsController < ApplicationController
    layout 'dashboard'
    include AttachmentsConcern
    
    def index
        @attachments = Attachment.all
    end
  
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
        # File.open(Rails.root.join('public', 'uploads', @attachment.file.original_filename), 'wb') do |file|
        #     file.write(@attachment.read)
        # end
        redirect_to "/events/#{params[:event_id]}"
    end
    
    def show
        @attachment = Attachment.find(params[:id])
        send_file(@attachment.file.path,
                :disposition => 'inline',
                :url_based_filename => true)
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

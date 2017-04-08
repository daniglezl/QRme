module AttachmentsConcern
  extend ActiveSupport::Concern

  def get_attachments
      @attachments = Attachment.all.order(:date)
  end

end
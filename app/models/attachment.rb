class Attachment < ActiveRecord::Base
  attr_accessible :attachment, :attachmentable_id, :attachmentable_type, :content_type, :file_name, :file_size

  mount_uploader :attachment, AttachmentUploader
  belongs_to :attachmentable, :polymorphic => true
  validates :attachmentable, :presence => true
  validates :attachment, :presence => true

  before_save :set_attachment_attributes

  protected

  def set_attachment_attributes
    if attachment.present? && attachment_changed?
      self.content_type = attachment.file.content_type
      self.file_size = attachment.file.size
      self.file_name = attachment.file.original_filename
    end  
  end

end

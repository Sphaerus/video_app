class Movie < ActiveRecord::Base
  belongs_to :user

  #has_attached_file :movie_file
  mount_uploader :movie_file, MovieFileUploader

  #validates_attachment :movie_file, presence: true,
  #content_type: { content_type: "video/matroska" }
  def set_success(format, opts)
    self.success = true
  end
end

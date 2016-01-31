class Image < ActiveRecord::Base
  belongs_to :movie

  validates :content, presence: true
  mount_uploader :content, ImageUploader
end

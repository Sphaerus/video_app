class Movie < ActiveRecord::Base
  belongs_to :user
  has_many :images, dependent: :destroy

  validates :title, presence: true

  accepts_nested_attributes_for :images

  mount_uploader :movie_file, MovieFileUploader
end

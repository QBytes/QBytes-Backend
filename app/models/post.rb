class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :user
  mount_uploader :picture, PostPictureUploader
end

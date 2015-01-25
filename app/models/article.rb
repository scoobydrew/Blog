class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy  
  has_and_belongs_to_many :tags, :uniq => true
  has_and_belongs_to_many :users
  validates :title, presence: true, length: { minimum: 5 }
  mount_uploader :thumbnail, ThumbnailUploader
end

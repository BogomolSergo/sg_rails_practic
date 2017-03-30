class Post < ActiveRecord::Base
  belongs_to :user
  has_many :images, :as => :imageable, dependent: :destroy
  attr_accessible :title, :body
  validates :id, :presence => true

  scope :published_posts, -> { where('published_at IS NOT NULL') }
end

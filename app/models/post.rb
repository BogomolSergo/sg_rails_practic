class Post < ActiveRecord::Base
  belongs_to :user
  has_many :images, :as => :imageable
  attr_accessible :title, :body
  validates :id, :presence => true
end

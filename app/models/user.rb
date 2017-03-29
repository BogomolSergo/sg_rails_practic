class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :username, :password, :email, :birthday
  has_many :posts
  has_many :images, :as => :imageable

  validates :username, :password, :uniqueness => { :case_sensitive => false }
  validates :password, :length => { :minimum => 8 }
  validates :username, :email, :password, :presence => true

  def full_name
    self.first_name + ' ' + self.last_name
  end
end
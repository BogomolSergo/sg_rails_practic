class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :username, :password, :email, :birthday
  has_many :posts, dependent: :destroy
  has_many :images, :as => :imageable

  validates :username, :email, :uniqueness => true
  validates :password, :length => { :minimum => 8 }
  validates :username, :email, :password, :presence => true

  scope :older_than_18, -> { where('birthday < ?', 18.year.ago) }

  def fullname
    "#{first_name} #{last_name}"
  end
end
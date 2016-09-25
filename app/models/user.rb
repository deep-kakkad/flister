class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  # has_attached_file :profile_image, styles: { medium: "300x300>", thumb: "500x500>" }, default_url: "/images/:style/missing.png"
  has_attached_file :profile_image, styles: { medium: "150x150>", thumb: "500x500>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :profile_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :profile_image, attachment_presence: true
end

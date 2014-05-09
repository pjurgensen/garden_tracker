class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # validates :username, presence: true
  # valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email,
  #           presence: true,
  #           format: { with: valid_email_regex },
  #           uniqueness: true,
  #           case_sensitive: false
  # validates :password, presence: true, length: { minimum: 6 }
  # validates :password_digest, presence: true, uniqueness: true
end

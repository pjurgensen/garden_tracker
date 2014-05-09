class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true

  def send_confirmation_instructions
    MyMailer.confirmation_instructions(self, @token).deliver
  end

end

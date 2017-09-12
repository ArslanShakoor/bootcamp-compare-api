class User < ApplicationRecord
	  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable


  acts_as_token_authenticatable
  validates_presence_of :first_name, :last_name, :email, :password

  def mark_as_confirmed!
    self.confirmation_token = nil
    self.confirmed_at = Time.now.utc
    save
  end
   
  has_many :camps  
  has_many :ratings   
end

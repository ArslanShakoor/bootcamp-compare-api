class User < ApplicationRecord

  # validation of presence
  validates_presence_of :first_name, :last_name, :email, :password

  #validation of lengths
  validates_length_of :first_name, in: 3..12
	validates_length_of :last_name, in: 3..12
	validates_length_of :email, in: 10..100


  #simple token authentication
  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

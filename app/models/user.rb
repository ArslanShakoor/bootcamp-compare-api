class User < ApplicationRecord
  # validation of presence of fields
  validates_presence_of :first_name, :last_name, :email, :password

  validates_length_of :first_name, in: 6..26
  validates_length_of :last_name, in: 6..26
  validates_length_of :email, in: 10..100
  validates_length_of :password, in: 6..50

	acts_as_token_authenticatable

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
				:recoverable, :rememberable, :trackable, :validatable,
				:confirmable

  def mark_as_confirmed!
    self.confirmation_token = nil
    self.confirmed_at = Time.now.utc
    save
  end


end

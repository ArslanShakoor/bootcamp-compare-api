class User < ApplicationRecord
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

  has_many :camps

end

class AdminUser < User
  has_many :camps, foreign_key: "user_id" 
end

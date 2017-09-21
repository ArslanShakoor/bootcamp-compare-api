class Admin < User
  #relationship with depnenent deletion
  has_many :camps, dependent: :destroy
end

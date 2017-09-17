class RemoveForeignKeyUsersId < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:ratings, :user, index: true)
  end
end

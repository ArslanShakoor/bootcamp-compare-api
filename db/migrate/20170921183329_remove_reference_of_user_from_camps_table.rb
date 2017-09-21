class RemoveReferenceOfUserFromCampsTable < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:camps, :user, index: true)
  end
end

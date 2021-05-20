class AddUniqueIndexToApplications < ActiveRecord::Migration[5.2]
  def change
    add_index :applications, [:user_id, :pet_id], unique: true
  end
end

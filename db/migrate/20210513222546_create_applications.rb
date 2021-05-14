class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.references :user, foreign_key: true
      t.references :pet, foreign_key: true
      t.integer :status, default: 0
      t.text :description

      t.timestamps
    end
  end
end

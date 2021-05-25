class AddColumnToApplication < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :pet_name, :string
  end
end

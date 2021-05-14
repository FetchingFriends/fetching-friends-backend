class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :age
      t.integer :type
      t.string :breed
      t.text :description
      t.string :gender
      t.boolean :fixed, default: false
      t.boolean :house_trained, default: false
      t.text :photo_url_1
      t.text :photo_url_2
      t.text :photo_url_3
      t.boolean :good_with_kids, default: false
      t.boolean :good_with_animals, default: false

      t.timestamps
    end
  end
end

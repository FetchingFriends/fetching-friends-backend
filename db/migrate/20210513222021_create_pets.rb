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
      t.boolean :fixed
      t.boolean :house_trained
      t.text :photo_url_1
      t.text :photo_url_2
      t.text :photo_url_3
      t.boolean :good_with_kids
      t.boolean :good_with_animals

      t.timestamps
    end
  end
end

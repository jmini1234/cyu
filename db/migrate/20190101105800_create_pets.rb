class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end

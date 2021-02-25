class CreateWarriors < ActiveRecord::Migration[5.2]
  def change
    create_table :warriors do |t|
      t.string :name
      t.string :specialty
      t.integer :kills
      t.string :exp_level
      t.string :troops
      t.string :image

      t.timestamps
    end
  end
end

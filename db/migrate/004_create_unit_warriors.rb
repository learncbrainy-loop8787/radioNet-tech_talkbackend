class CreateUnitWarriors < ActiveRecord::Migration[5.2]
  def change
    create_table :unit_warriors do |t|
      t.references :unit, foreign_key: true
      t.references :warrior, foreign_key: true

      t.timestamps
    end
  end
end

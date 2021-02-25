class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.boolean :dday
      t.integer :user_id

      t.timestamps
    end
  end
end

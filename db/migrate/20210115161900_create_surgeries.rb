class CreateSurgeries < ActiveRecord::Migration[5.2]
  def change
    create_table :surgeries do |t|
      t.string :title
      t.integer :day_of_week
      t.integer :operating_room_number

      t.timestamps
    end
  end
end

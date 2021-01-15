class CreateHospitials < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitials do |t|
      t.string :name

      t.timestamps
    end
  end
end

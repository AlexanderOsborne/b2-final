class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialty
      t.string :university
      t.references :hospitial, foreign_key: true

      t.timestamps
    end
  end
end

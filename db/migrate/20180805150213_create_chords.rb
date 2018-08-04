class CreateChords < ActiveRecord::Migration[5.0]
  def change
    create_table :chords do |t|
      t.string :name
      t.text :diagram
      t.timestamps null: false
    end
  end
end

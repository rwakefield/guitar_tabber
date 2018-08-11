class AddUniqueIndexToChordsName < ActiveRecord::Migration[5.0]
  def change
    add_index :chords, :name, unique: true
  end
end

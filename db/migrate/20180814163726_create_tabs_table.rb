class CreateTabsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :tabs do |t|
      t.string :name
      t.text :encoded_song
      t.timestamps null: false
    end
    add_index :tabs, :name, unique: true
  end
end

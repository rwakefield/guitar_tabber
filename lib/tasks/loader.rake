require 'csv'

namespace :loader do
  desc 'Load Chords from CSV'
  task load_chords: :environment do
    csv_text = File.read('lib/tasks/data/chords.csv')
    csv = CSV.parse(csv_text, headers: false)
    csv.each do |row|
      ChordLoader.new(row[0], row[1..6].map(&:to_i)).load
    end
  end
end

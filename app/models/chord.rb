class Chord < ApplicationRecord
  serialize :diagram
  validates_presence_of :name, :diagram
  validate :diagram_must_be_size_six

  def diagram_must_be_size_six
    if diagram && diagram.size != 6
      errors.add(:diagram, 'must be size of six')
    end
  end

  def notes
    notes = []
    diagram.reverse.each_with_index do |fret, index|
      string = 6 - index
      note = "#{string},#{fret}"
      notes.push(note)
    end
    notes.join('|')
  end
end


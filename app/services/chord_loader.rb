class ChordLoader
  attr_accessor :diagram, :name

  def initialize(name, diagram)
    @name = name
    @diagram = diagram
  end

  def load
    chord = Chord.find_or_initialize_by(name: name)
    chord.diagram = diagram
    chord.save!
  end
end

class ChordsPresenter
  attr_accessor :chords

  def initialize
    @chords = Chord.all
  end

  def chord_names
    @chord_names ||= chords.map(&:name)
  end
end

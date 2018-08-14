require 'test_helper'

describe 'ChordsPresenter' do
  describe '#chords' do
    it 'must be empty when there are no chords' do
      presenter = ChordsPresenter.new
      presenter.chords.must_be_empty
    end

    it 'must return all chords when there are some in the database' do
      g_chord = create :chord
      d_chord = create :chord, :d
      presenter = ChordsPresenter.new
      results = presenter.chords
      Chord.count.must_equal results.count
      results.must_include d_chord
      results.must_include g_chord
    end
  end

  describe '#chord_names' do
    it 'will return the chord names sorted when there are chords' do
      g_chord = create :chord
      d_chord = create :chord, :d
      presenter = ChordsPresenter.new
      presenter.chord_names.must_equal ['D', 'G']
    end

    it 'must_be_empty when there are no chords' do
      presenter = ChordsPresenter.new
      presenter.chord_names.must_be_empty
    end
  end
end

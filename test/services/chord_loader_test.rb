require 'test_helper'

describe 'ChordLoader' do
  describe '#load' do
    it 'will not duplicate chords' do
      loader = ChordLoader.new('G', [3, 2, 0, 0, 0, 3])
      loader.load
      loader.load
      Chord.count.must_equal 1
    end

    describe 'when the chord does not exist' do
      it 'will create a chord' do
        ChordLoader.new('G', [3, 2, 0, 0, 0, 3]).load
        Chord.count.must_equal 1
        chord = Chord.first
        chord.name.must_equal 'G'
        chord.diagram.must_equal [3, 2, 0, 0, 0, 3]
      end
    end

    describe 'when the chord exists' do
      it 'will update the chord diagram' do
        Chord.create(name: 'G', diagram: [1, 2, 3, 4, 5, 6])
        Chord.count.must_equal 1
        Chord.first.diagram.must_equal [1, 2, 3, 4, 5, 6]
        ChordLoader.new('G', [3, 2, 0, 0, 0, 3]).load
        Chord.count.must_equal 1
        Chord.first.diagram.must_equal [3, 2, 0, 0, 0, 3]
      end
    end
  end
end

require 'test_helper'

describe 'Chord' do
  describe 'validations' do
    it 'must validate the presence of name' do
      chord = Chord.new(diagram: [1, 2, 3, 4, 5, 6])
      chord.valid?.must_equal false
      chord.errors.size.must_equal 1
      chord.errors.full_messages.must_include "Name can't be blank"
    end

    it 'must validate the presence of diagram' do
      chord = Chord.new(name: 'G')
      chord.valid?.must_equal false
      chord.errors.size.must_equal 1
      chord.errors.full_messages.must_include "Diagram can't be blank"
    end

    it 'must validate the size of diagram' do
      chord = Chord.new(name: 'G', diagram: [1, 2, 3])
      chord.valid?.must_equal false
      chord.errors.size.must_equal 1
      chord.errors.full_messages.must_include 'Diagram must be size of six'
    end

    it 'must validate the uniqueness of name' do
      Chord.new(name: 'G', diagram: [1, 2, 3, 4, 5, 6]).save
      chord = Chord.new(name: 'G', diagram: [1, 2, 3, 4, 5, 6])
      chord.valid?.must_equal false
      chord.errors.size.must_equal 1
      chord.errors.full_messages.must_include 'Name has already been taken'
    end
  end
end

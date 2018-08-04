require 'test_helper'

describe 'Chord' do
  describe 'validations' do
    it 'must validate the presence of name' do
      chord = Chord.new
      chord.valid?.must_equal false
      chord.errors.full_messages.must_include "Name can't be blank"
    end

    it 'must validate the presence of diagram' do
      chord = Chord.new
      chord.valid?.must_equal false
      chord.errors.full_messages.must_include "Diagram can't be blank"
    end

    it 'must validate the size of diagram' do
      chord = Chord.new(name: 'G', diagram: [1, 2, 3])
      chord.valid?.must_equal false
      chord.errors.full_messages.must_include 'Diagram must be size of six'
    end
  end
end

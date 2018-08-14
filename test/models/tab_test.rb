require 'test_helper'

describe 'Tab' do
  describe 'validations' do
    it 'must validate the presence of name' do
      tab = Tab.new(encoded_song: '6,2-6,2-5,0-5,0-5,1-6,3|5,2|4,0|3,0|2,0|1,3')
      tab.valid?.must_equal false
      tab.errors.size.must_equal 1
      tab.errors.full_messages.must_include "Name can't be blank"
    end

    it 'must validate the presence of encoded_song and output different attribute name' do
      tab = Tab.new(name: 'Cool Song')
      tab.valid?.must_equal false
      tab.errors.size.must_equal 1
      tab.errors.full_messages.must_include "Song can't be blank"
    end

    it 'must validate the uniqueness of name' do
      Tab.new(name: 'Cool Song', encoded_song: '6,2-6,2-5,0-5,0-5,1-6,3|5,2|4,0|3,0|2,0|1,3').save
      tab = Tab.new(name: 'Cool Song', encoded_song: '6,2-6,2-5,0-5,0-5,1-6,3|5,2|4,0|3,0|2,0|1,3')
      tab.valid?.must_equal false
      tab.errors.size.must_equal 1
      tab.errors.full_messages.must_include 'Name has already been taken'
    end
  end
end

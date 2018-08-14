require 'test_helper'

describe 'Tab' do
  describe 'validations' do
    it 'must validate the presence of name' do
      tab = build :tab, name: nil
      tab.valid?.must_equal false
      tab.errors.size.must_equal 1
      tab.errors.full_messages.must_include "Name can't be blank"
    end

    it 'must validate the presence of encoded_song and output different attribute name' do
      tab = build :tab, encoded_song: nil
      tab.valid?.must_equal false
      tab.errors.size.must_equal 1
      tab.errors.full_messages.must_include "Song can't be blank"
    end

    it 'must validate the uniqueness of name' do
      create :tab
      tab = build :tab
      tab.valid?.must_equal false
      tab.errors.size.must_equal 1
      tab.errors.full_messages.must_include 'Name has already been taken'
    end
  end
end

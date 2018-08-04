require 'rake'
require 'test_helper'

describe 'Loader' do
  before do
    Rake::Task.clear
    GuitarTabber::Application.load_tasks
  end

  describe '#load_chords' do
    subject { Rake::Task['loader:load_chords'] }

    it 'should load the chords from the csv' do
      subject.invoke
      assert_chords
    end

    it 'should be idempotent' do
      subject.invoke
      subject.invoke
      assert_chords
    end
  end

  def assert_chords
    Chord.count.must_equal 7
  end
end

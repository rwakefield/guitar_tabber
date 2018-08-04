class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :chords_presenter

  def chords_presenter
    @chords_presenter ||= ChordsPresenter.new
  end
end

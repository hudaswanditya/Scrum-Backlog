class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :counter

  def counter
    @count = Story.count
  end

end

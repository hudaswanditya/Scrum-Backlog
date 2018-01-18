require 'rest-client'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :counter

  def counter
    @count = Story.count
    base_url = 'http://api.github.com/repos/hudaswanditya/Scrum-Backlog/issues'
    #key = 'b65be6917d3f186895e8f5ed2b3c505a'
    url = base_url
    body = RestClient.get(url)
    @issues = JSON.parse(body)
  end

end

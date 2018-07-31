require 'rest-client'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :init

  def init
    base_url = 'http://api.github.com/repos/hudaswanditya/Scrum-Backlog/issues'
    url = base_url
    @issues = nil
    begin
      body = RestClient.get(url)
    rescue RestClient::Unauthorized, RestClient::Forbidden => err
      puts 'Access denied'
      return err.response
    rescue RestClient::ImATeapot => err
      puts 'The server is a teapot! # RFC 2324'
      return err.response
    else
      puts 'It worked!'
      @issues = JSON.parse(body)
      return body
    end
  end

end

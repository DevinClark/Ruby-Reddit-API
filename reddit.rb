require 'net/http'
require 'rubygems'
require 'json'
require 'date'
require 'time'

class Reddit
  attr_accessor :username, :data

  def initialize(username)
    @username = username
    @data = get_data
  end

  def get_data
    uri = URI.parse("http://www.reddit.com/user/#{@username}/about.json")
    page = Net::HTTP.get(uri)
    JSON.parse(page)
  end

  def link_karma
    @data['data']['link_karma']
  end

  def comment_karma
    @data['data']['comment_karma']
  end

  def has_mail
    !!@data['data']['has_mail']
  end

  def has_mod_mail
    !!@data['data']['has_mod_mail']
  end

  def is_gold
    !!@data['data']['is_gold']
  end

  def is_friend
    !!@data['data']['is_friend']
  end

  def over_18
    !!@data['data']['over_18']
  end

  def to_s
    "Reddit: #{username} #{link_karma}:#{comment_karma}"
  end
end
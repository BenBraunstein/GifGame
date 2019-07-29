class GifsController < ApplicationController

  def results
    query = params["query"]
    uri = URI.parse("https://api.tenor.com/v1/search?q=#{query}&key=#{ENV['TENOR_KEY']}&limit=8")
    response = Net::HTTP.get_response(uri)
    body = JSON.parse(response.body)
    gif_urls = body["results"].map {|gif| gif["media"].first["gif"]["url"]}
    @gifs = gif_urls
  end
end

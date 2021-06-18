require 'httparty'

class PagesController < ApplicationController
  include HTTParty
  skip_before_action :authenticate_user!, only: :home
  def home
    @video_games = VideoGame.all
    @homepage_video_games = @video_games.sample(3)
    # raise
    # http = Net::HTTP.new('api.igdb.com/v4', 443)
    # http.use_ssl = true
    # request = Net::HTTP::Post.new(URI('https://api.igdb.com/v4/games'),
    # { 'Client-ID' => ENV['IGDB_CLIENT'],
    # 'Authorization' => "Bearer #{ENV['IGDB_TOKEN']}" })
    # request.body = 'fields artworks,category,collection,cover,game_modes,genres,name,rating,screenshots,slug,tags;'
    # response = http.request(request).body
    # raise

    response = HTTParty.post("https://api.igdb.com/v4/games",
                             body: { text: "fields artworks,category,collection,cover,game_modes,genres,name,rating,slug; search 'Pokemon';" }.to_json,
                             headers: { 'Client-ID' => ENV['IGDB_CLIENT'],
                                        'Authorization' => "Bearer #{ENV['IGDB_TOKEN']}" })
    json = JSON.parse(response.body)
    # raise
  end
end

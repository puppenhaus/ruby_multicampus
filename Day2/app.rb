require 'sinatra'
require 'sinatra/reloader'
require 'csv'
require 'date'

require 'nokogiri'
require 'httparty'
require 'uri'

get '/lolfinder' do
  erb :lolfinder
end

get '/' do
  erb :index
  #views폴더 안의 인덱스를 보여줌
  #'hello world'
end

get '/welcome/:name' do
  @name = params[:name]
  @time = Time.now.to_s
  CSV.open('user.csv', 'a+') do |data|
    #타임.나우를 쓰려면 리콰이어 데이트
    data << [@name.to_s, @time]
  #CSV, 콤마세퍼레이티드 :쉼표로 구분
  #a+는 계속해서 기록(쌓여나감)
  #<< array의 요소
  end
  erb :welcome
end

get '/users' do
  @users = []
  CSV.foreach('user.csv') do |row|
    @users << row
  end
  erb :users
end

get '/lol' do
  username = prams[:username]
  url = "http://www.op.gg/summoner/userName=#{username}"
  url = URI.encode(url) #한글 유알엘을 인코딩한다.
  response = HTTParty.get(url) #요청정보 보냄
  doc = Nokogiri::HTML(response) #검색하기 편하게
  @win = doc.css("#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.wins")
  @lose = doc.css("#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.losses")

  erb :lol
end

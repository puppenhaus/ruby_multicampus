#gem을 사용하기 위해 불러옴.
#요청을 보내기 위한 httparty
require 'httparty'
#원하는 정보를 가져오기 위한 노코기리
require 'nokogiri'

#네이버 국내증시 주소를 url에 저장.
url = "http://finance.naver.com/sise/"

#url을 통해서 요청.
response = HTTParty.get(url)

#가져온 문서를 노코기리 형식으로 저장.
doc = Nokogiri::HTML(response)

#문서에서 css중 ID가 코스피_나우 인 것을 코스피라는 변수에 저장.
#css를 가져오기 위해 크롬에서 카피셀렉터
kospi = doc.css("#KOSPI_now")

#코스피에 저장된 것 중에서 태그 안에 있는 텍스트를 출력.
puts kospi.texts

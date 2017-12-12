require 'launchy'

key = ["트와이스","수지","아이유","BTS"]

url = "https://search.naver.com/search.naver?query="

key.each do |keyy|
	keyword = url + keyy
Launchy.open(keyword)
end
#puts "멀티캠퍼스 짱짱"
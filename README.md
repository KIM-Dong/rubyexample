2017 - 12 - 8

  `ruby`

1. 주식정보 크롤링

```ruby
require 'nokogiri'
require 'httparty'


key = ['#KOSPI_now','#KOSDAQ_now','#KPI200_now']
url = 'http://finance.naver.com/sise/'
response = HTTParty.get(url)
text = Nokogiri::HTML(response.body)

key.each do |keyy|
	keyword = text.css(keyy)
puts keyword.text
end
```



2. 파일만들기 실습

   ```ruby
   Dir.chdir("files")

   # 30개의 파일을 만듭니다.
   30.times do |n|
   	n+=1
   	File.open(n.to_s + ".txt", "w") do |file|
   		file.write(n.to_s + "번째 내용입니다.")
   	end
   end
   # 1.txt ~ 30.txt
   # 1.txt => 1번째 내용
   # 30.txt => 30번째 내용

   ```

   - 30번 루프를 돌기위해 쓰는 구문 숙지
   - open : 없으면 생성하고 있으면 열어달라
   - "w" 를 써줘야된다
   - n.to_s 는 n이라는 숫자를 string으로 변환시킨다 -> 그래야 .txt와 합칠 수 있으니



2017 - 12 - 11

1. 파일이름 바꾸기

```ruby
# 폴더 안으로 들어갑니다.
Dir.chdir("files")
# 폴더 안을 돌면서 파일들의 이름을  가져옵니다.
# files라는 변수에 폴더에 있는 파일들 다 담는과정.
files = Dir.entries(Dir.pwd).reject {|name|name[0] == '.'}
files.each do |file|
	File.rename(file, "mulcam" + file)
end
# 각각의 파일을 1.txt => mulcam1.txt
```

2. 주식

```ruby
require 'stock_quote'
#companies를 돌면서 요소별로
DATA.each do |c|

   	c.chomp!

   	stock = StockQuote::Stock.quote(c)

   	puts "#{stock.name} 의 가격은 $ #{stock.l}"

   end

   END

   aapl

   tsla

   ssnlf

   googl

   fb

   msft	
```

- 변수선언 대신 END 써서 이하에 것들 다 가져올 수 있게 -> DATA 를 쓰면 됨.



3. 통화키

```ruby
require 'eu_central_bank'

from = 'USD'
to = 'KRW'

bank = EuCentralBank.new
bank.update_rates

result = bank.exchange(100, from, to)

puts "#{from} => #{to} : $1 => #{result}원"
```



4. 주식 & 통화키

   ```ruby
   def exchange(from, to, amount)
   	
   	amount = amount.to_i if amount.is_a? String
   	bank = EuCentralBank.new
   	bank.update_rates
   	amount * bank.exchange(100, from, to)

   end

   ARGV.each do |company|
   	stock = StockQuote::Stock.quote(company)
   	puts "#{stock.name} 의 가격은 => #{stock.l} / #{exchange 'USD', 'KRW', stock.l}원"

   ```

   - ruby ~~~.rb 이후에 보고싶은 회사 이름 넣으면 가격 보여주고 변환된 가격도 보여줌.
require 'stock_quote'


# companies를 돌면서 요소별로
DATA.each do |c|
	c.chomp!
	stock = StockQuote::Stock.quote(c)

	puts "#{stock.name} 의 가격은 $ #{stock.l}"
end

__END__
aapl
tsla
ssnlf
googl
fb
msft	

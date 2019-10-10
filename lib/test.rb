require 'open-uri'
require 'nokogiri'
require 'pry'
require 'open-uri'
require 'nokogiri'



	@doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

	
	currency = @doc.xpath('//td[@class = "text-left col-symbol"]')
	

array_symb = []

currency.each do |coin|
array_symb << coin.text 
	end


	price = @doc.xpath('//td/a[@class="price"]')

array_price = []

price.each do |pr|
	array_price << pr.text.delete('$')
end	





	 hash = array_symb.zip(array_price).to_h

	print "#{hash}"


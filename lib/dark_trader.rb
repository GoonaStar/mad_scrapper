require 'open-uri'
require 'nokogiri'


	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

def sign
doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	symbol = doc.xpath('//td[@class = "text-left col-symbol"]')
		sign_array= []


	symbol.each do |symbol|
	sign_array << symbol.text 
	end
	return sign_array
end

sign_array=sign



def price
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	value = doc.xpath('//td/a[@class="price"]')

value_array = []

value.each do |pr|
	value_array << pr.text.delete('$')
end	
 return value_array
end

value_array = price


def final_hash (sign_array, value_array)
 sign_array.map.with_index do |key, value|
	last_hash = {}
	last_hash[key] = value_array[value]
	last_hash
end
end



print final_hash(sign_array, value_array)


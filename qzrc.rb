# encoding: utf-8
require 'nokogiri'
require 'open-uri'

#@doc = Iconv.iconv("UTF-8","GB2312", Nokogiri::HTML(open("http://www.qzrc.com/CompanyDetail.aspx?id=38740#243805")))  
# @doc = Nokogiri::HTML(open("http://www.qzrc.com/CompanyDetail.aspx?id=53898").read.to_s.encode("UTF-8") )
@doc = Nokogiri::HTML(open("http://www.qzrc.com/CompanyDetail.aspx?id=53898"),nil,"utf-8")
#puts @doc.css(".a333 a").to_s.force_encoding("UTF-8")
#puts @doc.css(".a333 a")
#puts @doc.css(".a333 a").text()

#puts @doc.css(".a333 a").last.attr('href')
# @doc.css(".a333 a").each do |item| 
# 	a_name = item.attr('href').delete "#"
# 	#a_name= a_name.slice(1,a_name.length)

# 	#puts a_name
# 	puts @doc.css("a[name='#{a_name}'] + div[class='h150']").first
# end

a_name = @doc.css(".a333 a").first.attr('href').delete "#"
#a_name= a_name.slice(1,a_name.length)

@doc.css(".a333 a").each do |item|
	a_name = item.attr('href').delete "#"
	description = @doc.css("a[name='#{a_name}'] ~ div[class='sm'] ~ div").first.text()
end	

puts a = @doc.css("a[name='#{a_name}'] ~ div[class='sm'] ~ div").first.text().to_s.encode("UTF-8") 

f = open("test.txt","a") 
f.puts a
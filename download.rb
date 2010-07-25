require 'rubygems'
require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open("http://164.100.47.132/LssNew/Debates/textofdebate.aspx"))
links = doc.xpath("//table[@id='ctl00_ContPlaceHolderMain_Textofdebate1_DataGrid1']//a")
puts "No of records: #{links.size}"
links.each do |a|
  puts a
end

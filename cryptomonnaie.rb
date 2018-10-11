require 'nokogiri'
require 'open-uri'

def get_name_and_price
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    tabname = []
    tabvalue = []
    doc.css('a.currency-name-container.link-secondary').each do |element| tabname << ["name" => element.text] end
    doc.css('a.price').each do |element| tabvalue << ["value" => element.text] end
    p myhash = Hash[tabname.zip(tabvalue)]
    while 0 == 0
    p myhash
    sleep 3600
    end
end

get_name_and_price
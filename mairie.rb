require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage(url)
    doc = Nokogiri::HTML(open(url))
    doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |element| return ["email" => element.text] end
end
    
def get_all_the_urls_of_val_doise_townhalls
    doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
    urlend = []
    tabname = []
    doc.xpath('//p/a/@href').each do |i| urlend << i.content end
    doc.css('.Style20 a').each do |i| tabname << ["name" => i.content] end
    i = 0
    urlsize = urlend.size
    while i < urlsize
       urlend[i][0] = ''
       urlend[i] = get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com#{urlend[i]}")
        i += 1
    end
    puts myhash = Hash[tabname.zip(urlend)]
end

get_all_the_urls_of_val_doise_townhalls
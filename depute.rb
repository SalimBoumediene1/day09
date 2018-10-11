require 'nokogiri'
require 'open-uri'

def get_name_and_first_name(url)
    doc = Nokogiri::HTML(open(url))
    name = {}
    firstname = {}
    mail = {}
    myhash = {}
    doc.css('h1').each do |element| name = element.text[3..-1].split(' ')[1] end
    doc.css('h1').each do |element| firstname = element.text[3..-1].split(' ')[0] end
    doc.xpath('/html/body/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li/a/@href').each do |element| mail = element.text[7..-1] end
    return p myhash = {"name" => name, "firstname" => firstname, "mail" => mail}
    
end

def get_all_mail_depute
    doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    taburl = []
    lasturl = []
    myhash = {}
    doc.css('div#deputes-list div.clearfix.col-container ul.col3 li a @href').each do |url| taburl << url.text end
    taburl.each do |finalurl|  myhash = get_name_and_first_name("http://www2.assemblee-nationale.fr#{finalurl}") end
    end

    get_all_mail_depute
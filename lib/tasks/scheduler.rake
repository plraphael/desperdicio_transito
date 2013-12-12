desc "Pega o congestionamento atual no site da CET"

task :get_medicoes => :environment do
  require 'nokogiri'
  require 'open-uri'

  url = "http://cetsp1.cetsp.com.br/monitransmapa/agora/"
  doc = Nokogiri::HTML(open(url))
  km_site = doc.at_css("#lentidao b").text

  Medicao.create(km: km_site)

end
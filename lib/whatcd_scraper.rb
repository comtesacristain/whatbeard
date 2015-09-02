require 'mechanize'


class WhatcdScraper < Scraper
  LOGIN = {url:"https://what.cd/login.php",action:"login.php"}

  def credentials(path=nil)
    YAML::load_file("#{Rails.root}/config/whatcd.yml")
  end
  
end

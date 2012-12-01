# Copyright 2011 by Helder VAsconcelos (heldervasc@bearstouch.com).
# All rights reserved.

# Permission is granted for use, copying, modification, distribution,
# and distribution of modified versions of this work as long as the
# above copyright notice is included.

require 'rubygems'
require 'hpricot' 
require 'open-uri'
require 'cgi'
require File.expand_path(File.dirname(__FILE__) + "/android_market_application")

class AndroidMarket

@@game_categories=Array.[]('ARCADE','BRAIN','CARDS','CASUAL','GAME_WALLPAPER','RACING','SPORTS_GAMES','GAME_WIDGETS')
@@application_categories=Array.[]('BOOKS_AND_REFERENCE','BUSINESS','COMICS','COMMUNICATION','EDUCATION','ENTERTAINMENT','FINANCE','HEALTH_AND_FITNESS','LIBRARIES_AND_DEMO','LIFESTYLE','APP_WALLPAPER','MEDIA_AND_VIDEO','MEDICAL','MUSIC_AND_AUDIO','NEWS_AND_MAGAZINES','PERSONALIZATION','PHOTOGRAPHY','PRODUCTIVITY','SHOPPING','SOCIAL','SPORTS','TOOLS','TRANSPORTATION','TRAVEL_AND_LOCAL','WEATHER','APP_WIDGETS')
@@languages=Array.[]('en','pt_PT','pt_BR','es','es_419','fr','it','es')
 
  def AndroidMarket.get_top_selling_free_app_in_category(category,position,language='en')
    url="https://market.android.com/details?id=apps_topselling_free&cat="+category+"&start="+(position-1).to_s+"&num=24&hl="+language
    doc = Hpricot(open(url,'User-Agent' => 'ruby'))
    buy_div=doc.search("//div[@class='buy-border']//a").first 
    puts "Getting Application package "+buy_div.attributes['data-docid']
    app=AndroidMarketApplication.new(buy_div.attributes['data-docid'],language)
    return app
  end
  
  def AndroidMarket.get_top_selling_paid_app_in_category(category,position,language='en')
    url="https://market.android.com/details?id=apps_topselling_paid&cat="+category+"&start="+(position-1).to_s+"&num=24&hl="+language
    doc = Hpricot(open(url,'User-Agent' => 'ruby'))
    buy_div=doc.search("//div[@class='buy-border']//a").first 
    puts "Getting Application package "+buy_div.attributes['data-docid']
    app=AndroidMarketApplication.new(buy_div.attributes['data-docid'],language)
    return app
  end
  

  def AndroidMarket.get_overall_top_selling_free_app(position,language='en')
    url="https://market.android.com/details?id=apps_topselling_free&start="+(position-1).to_s+"&num=24&hl="+language
    doc = Hpricot(open(url,'User-Agent' => 'ruby'))
    buy_div=doc.search("//div[@class='buy-border']//a").first 
    puts "Getting Application package "+buy_div.attributes['data-docid']
    app=AndroidMarketApplication.new(buy_div.attributes['data-docid'],language)
    return app
  end
  
  def AndroidMarket.get_overall_top_selling_paid_app(position,language='en')
    #position++
    url="https://market.android.com/details?id=apps_topselling_paid&start="+(position-1).to_s+"&num=24&hl="+language
    doc = Hpricot(open(url,'User-Agent' => 'ruby'))
    buy_div=doc.search("//div[@class='buy-border']//a").first 
    puts "Getting Application package "+buy_div.attributes['data-docid']
    app=AndroidMarketApplication.new(buy_div.attributes['data-docid'],language)
    return app
  end

  def AndroidMarket.get_developer_app_list(developer_name, position, language='en')
    url="https://play.google.com/store/apps/developer?id="+CGI.escape(developer_name)+"&start="+(position-1).to_s+"&num=24&hl="+language
    doc = Hpricot(open(url,'User-Agent' => 'ruby'))
    buy_lis=doc.search("li[@class='goog-inline-block']") 
    apps = Array.new
    buy_lis.each do |buy_li|
      puts "Getting Application package "+buy_li.attributes['data-docid']
      apps << AndroidMarketApplication.new(buy_li.attributes['data-docid'],language)
    end
    return apps 
  end
  
  def AndroidMarket.get_languages()
    return @@languages
  end
  
  def AndroidMarket.get_game_categories()
      return @@game_categories
  end
  
  def AndroidMarket.get_application_categories()
      return @@application_categories
  end
end  





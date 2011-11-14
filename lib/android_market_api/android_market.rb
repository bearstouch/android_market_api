###########################################
#
# Android Market Parser
# Creaated: 12/11/2011
# Author: Hélder VAsconcelos (heldervasc@bearstouch.com)
#
#############################################
require 'rubygems'
require 'hpricot' 
require 'open-uri'
require 'android_market_api/android_market_application'


module AndroidMarketApi

class AndroiMarket

@@game_categories=Array.[]('ARCADE','BRAIN','CARDS','CASUAL','GAME_WALLPAPER','RACING','SPORTS_GAMES','GAME_WIDGETS')
@@application_categories=Array.[]('BOOKS_AND_REFERENCE','BUSINESS','COMICS','COMMUNICATION','EDUCATION','ENTERTAINMENT','FINANCE','HEALTH_AND_FITNESS','LIBRARIES_AND_DEMO','LIFESTYLE','APP_WALLPAPER','MEDIA_AND_VIDEO','MEDICAL','MUSIC_AND_AUDIO','NEWS_AND_MAGAZINES','PERSONALIZATION','PHOTOGRAPHY','PRODUCTIVITY','SHOPPING','SOCIAL','SPORTS','TOOLS','TRANSPORTATION','TRAVEL_AND_LOCAL','WEATHER','APP_WIDGETS')

  #Get Top selling Paids apps for a category
  def AndroiMarket.get_top_selling_paid_apps(category,language='en',start=0)
    apps=Array.new
    url="https://market.android.com/details?id=apps_topselling_paid&cat="+category+"&start="+start.to_s+"&num=24&hl="+language
    doc = Hpricot(open(url,'User-Agent' => 'ruby'))
    #i=1
    doc.search("//div[@class='buy-border']//a").each do |buy_div|  
     #puts '-------------------------------------------------'
     #puts "| Applicaton Ranking "+i.to_s
     #puts "| Application Name = "+buy_div.attributes['data-doctitle']
     #puts "| Application Package = "+buy_div.attributes['data-docid']
     #puts "| Application Price = "+(buy_div.attributes['data-docpricemicros'].to_i/1000000).to_s
     #puts '-------------------------------------------------'
     puts "Getting Application package "+buy_div.attributes['data-docid']
     app=AndroidMarketApplication.new(buy_div.attributes['data-docid'],language)
     apps.push(app)
     #i=i+1
    end
    return apps
  end
  
  #Get Top selling Free apps for a category
  def AndroiMarket.get_top_selling_free_apps(category,language='en',start=0)
    apps=Array.new
    url="https://market.android.com/details?id=apps_topselling_free&cat="+category+"&start="+start.to_s+"&num=24&hl="+language
     doc = Hpricot(open(url,'User-Agent' => 'ruby'))
      #i=1
      doc.search("//div[@class='buy-border']//a").each do |buy_div|  
       #puts '-------------------------------------------------'
       #puts "| Applicaton Ranking "+i.to_s
       #puts "| Application Name = "+buy_div.attributes['data-doctitle']
       #puts "| Application Package = "+buy_div.attributes['data-docid']
       #puts "| Application Price = "+(buy_div.attributes['data-docpricemicros'].to_i/1000000).to_s
       #puts '-------------------------------------------------'
       puts "Getting Application package "+buy_div.attributes['data-docid']
       app=AndroidMarketApplication.new(buy_div.attributes['data-docid'],language)
       #i=i+1
       apps.push(app)
      end
      return apps
  end
  
end  
end
#puts "Starting ...."
#AndroiMarketApi.get_top_selling_free_apps("BRAIN",'en',0)[2].to_s
#api.getApplication(2).to_s
#app.parse()
#app.print_app_info()
#puts "Ending ...."

#!/usr/bin/env ruby
#--
# Copyright 2011 by Helder Vasconcelos (heldervasc@bearstouch.com).
# All rights reserved.

# Permission is granted for use, copying, modification, distribution,
# and distribution of modified versions of this work as long as the
# above copyright notice is included.
#++
require 'rubygems'
require 'hpricot' 
require 'open-uri'

module AndroidMarketApi

class AndroidMarketApplication 
  
  @name=""              # Application Name
  @package=""           # Package
  @current_version=0    # Application Current Version
  @price=0              # Application Price
  @ratting_value=0      # Ratting Value
  @ratting_count=0      # Nr of Votes
  @updated=""           # Last Upfate datetime
  @sdk_required=""      # SDK Required
  @category=""          # Category
  @downloads=""         # Ratting 
  @size=0               # Application Size
  @contentRating=""     # Content Ratting
  @description=""       # Application description
  @screenshots          # Screenshot URL Array
  @developer_name=""    # Developer Name 
  @icon=""              # Icon URL 
  @update_text          # Last Updates Array
  
  @@debug=0

  ###########################################################################################
  #  Contructor: Example Usage AndroidMarketApplication.new("com.bearstouch.smsscheduler")
  ############################################################################################
  def initialize(package,language='en')
        @package=package    
        parseInAndroidMarket(language) 
  end  
  
  ############################################
  # =>  Parse Default Page for your localization from Android Market 
  ############################################
  def parseInAndroidMarket(language)
    
    url="https://market.android.com/details?id="+@package+"&hl="+language
    puts "Getting URL="+url if @@debug == 1
    doc = Hpricot(open(url,'User-Agent' => 'ruby'))
    fill_application_name(doc) 
    fill_current_version(doc)  
    fill_price(doc)
    fill_ratting_value(doc)
    fill_ratting_count(doc)
    fill_updated_at(doc)
    fill_sdk_required(doc)
    fill_category(doc)
    fill_downloads(doc)
    fill_size(doc)
    fill_content_rating(doc)
    fill_description(doc)
    @screenshots=Array.new
     @update_text=Array.new
    fill_screenshots(doc)
    fill_developer_name(doc) 
    fill_icon(doc)    
    fill_changed_text(doc)
    
  end  
  
  def fill_application_name(doc)
     @name=doc.at("dl[@class='doc-metadata-list']/meta[@itemprop='name']")['content']
     puts "Apllication name ="+@name.to_s  if @@debug == 1
  end
  
  def fill_current_version(doc)    
     @current_version=doc.at("dl[@class='doc-metadata-list']/dd[@itemprop='softwareVersion']").inner_html
     puts "Apllication Version="+@current_version.to_s if @@debug == 1
  end
  
  def fill_price(doc)
    @price=doc.at("dl[@class='doc-metadata-list']/dd[@itemprop='offers']/span[@itemprop='price']")['content']
     puts "Apllication Price="+@price.to_s if @@debug == 1
    
  end
  
  def fill_ratting_value(doc)
     @ratting_value=doc.at("dl[@class='doc-metadata-list']/dd[@itemprop='aggregateRating']/div[@itemprop='ratingValue']")['content']
       puts "Apllication Ratting Value ="+@ratting_value.to_s if @@debug == 1
  end
  
  def fill_ratting_count(doc)
    @ratting_count=doc.at("dl[@class='doc-metadata-list']/dd[@itemprop='aggregateRating']/span[@itemprop='ratingCount']").inner_html
    puts "Apllication ratting_count="+@ratting_count.to_s if @@debug == 1
    
  end
  
  def fill_updated_at(doc) 
      @updated=doc.at("dl[@class='doc-metadata-list']/dd/time[@itemprop='datePublished']").inner_html
        puts "Apllication updated="+@updated.to_s if @@debug == 1
    
  end
  
  def fill_sdk_required(doc)
    @sdk_required=doc.at("dl[@class='doc-metadata-list']/dt[@itemprop='operatingSystems']").next_node.inner_html
    puts "Apllication SDK="+@sdk_required.to_s   if @@debug == 1
  end
  
  def fill_category(doc)
     #@category=doc.at("dl[@class='doc-metadata-list']/dt[@itemprop='operatingSystems']").next_node.inner_html
    #  puts "Apllication category="+@category.to_s   if @@debug == 1
  end

  def fill_downloads(doc)
     @downloads=doc.at("dd[@itemprop='numDownloads']").children.first
      puts "Apllication install category="+@downloads.to_s if @@debug == 1
    
  end

  def fill_size(doc)
    @size=doc.at("dl[@class='doc-metadata-list']/dd[@itemprop='fileSize']").inner_html
    puts "Apllication Size="+@size.to_s if @@debug == 1
    
  end
  
  def fill_content_rating(doc)
     @contentRating=doc.at("dl[@class='doc-metadata-list']/dd[@itemprop='contentRating']").inner_html
      puts "Apllication Content Rating="+@contentRating.to_s if @@debug == 1
  end

  def fill_description(doc)
    @description=doc.at("div[@id='doc-original-text']").inner_html
    puts "Apllication Description ="+@description.to_s   if @@debug == 1
   end
   
  def fill_screenshots(doc)
     (doc/"div[@class='screenshot-carousel-content-container']/img").each  do |img|         
        puts "addding "+img['src'].to_s if @@debug == 1   
        @screenshots.push(img['src'].to_s)
     end
  end

  def fill_developer_name(doc) 
     @developer_name=doc.at("a[@class='doc-header-link']").inner_html
        puts "Apllication Author= "+@developer_name.to_s if @@debug == 1
  end

  def fill_icon(doc)
    @icon=doc.at("div[@class='doc-banner-icon']/img")['src']
    puts "Apllication Icon= "+@icon.to_s if @@debug == 1
  end
  
  def fill_changed_text(doc)    
     (doc/"div[@class='doc-whatsnew-container']/ol/li").each  do |parag|
          puts "Apllication Update= "+parag.inner_html if @@debug == 1
            @update_text << parag.inner_html
     end
  end
  
  def to_s()
    puts "-------------------------------------------------------------"
    puts " Application Name = "+@name.to_s
    puts " Application Package = "+@package.to_s
    puts " Application Current Version = "+@current_version.to_s
    puts " Application Price = "+@price.to_s
    puts " Application Ratting Value = "+@ratting_value.to_s
    puts " Application Ratting Count = "+@ratting_count.to_s
    puts " Application Updated = "+@updated.to_s
    puts " SDK required = "+@sdk_required.to_s
  # puts " Category = "+@category.to_s
    puts " Nr of Downloads = "+@downloads.to_s
    puts " Size = "+@size.to_s
    puts " Content Ratting = "+@contentRating.to_s
    puts " Application description = "+@description.to_s
    puts " Developer Name = "+@developer_name.to_s
    puts " Icon URL = "+@icon.to_s
    puts "-------------------------------------------------------------"
  end  
  
end  

end

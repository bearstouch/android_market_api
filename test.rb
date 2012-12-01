#!/usr/bin/ruby
###########################################
#
# Android Market Parser
# Creaated: 12/11/2011
# Author: Hélder VAsconcelos (heldervasc@bearstouch.com)
#
#############################################
require 'rubygems'
require File.expand_path(File.dirname(__FILE__) + '/lib/android_market_api')

#puts "Starting ...."
app=AndroidMarketApplication.new('com.bearstouch.smsscheduler')
app.to_s

apps=AndroidMarket.get_developer_app_list("Google Inc.", 1)
apps.each do |app|
  app.to_s
end
#puts "Ending"

#app=AndroidMarket.get_top_selling_free_app_in_category('COMMUNICATION',100,'pt')

#app.to_s


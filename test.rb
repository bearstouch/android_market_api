#!/usr/bin/ruby
###########################################
#
# Android Market Parser
# Creaated: 12/11/2011
# Author: Hélder VAsconcelos (heldervasc@bearstouch.com)
#
#############################################
require 'rubygems'
require 'android_market_api'

#puts "Starting ...."
app=AndroidMarketApplication.new('com.bearstouch.smsscheduler')
app.to_s
#puts "Ending"

#app=AndroidMarket.get_top_selling_free_app_in_category('COMMUNICATION',100,'pt')

#app.to_s


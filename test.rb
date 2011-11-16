#!/opt/local/bin/ruby
###########################################
#
# Android Market Parser
# Creaated: 12/11/2011
# Author: Hélder VAsconcelos (heldervasc@bearstouch.com)
#
#############################################
require 'rubygems'
require 'android_market_api'

puts "Starting ...."
$app=AndroidMarketApi::AndroidMarketApplication.new('com.zeptolab.ctr.paid')
$app.to_s
puts "Ending"

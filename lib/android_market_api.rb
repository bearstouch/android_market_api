# == About android_market_api.rb
#
# All of Android Market Api's various part are loaded when you use <tt>require 'android_market_api'</tt>.
begin
  require 'encoding/character/utf-8'
rescue LoadError
end
require "android_market_api/version"
require "android_market_api/android_market_application"
require "android_market_api/android_market"
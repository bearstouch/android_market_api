# About Android Market API [![Build Status](https://travis-ci.org/drecom/android_market_api.png)](https://travis-ci.org/drecom/android_market_api)

## What is Android Market API

Android Market API  is an open source Android Market Ruby Library for parsing Android Market information.

This project is under development.

Fell free to clone it and submit your changes to us.

## Install the gem ##

Install it with [RubyGems](https://rubygems.org/)

```
gem install android_market_api
```

or add this to your Gemfile if you use [Bundler](http://gembundler.com/):

```ruby
gem "android_market_api"

```

## Getting started ##

###For parsing an application on Android Market

```ruby
require 'rubygems'
require 'android_market_api'

app=AndroidMarketApplication.new('com.bearstouch.smsscheduler')

# Getting Application Name
puts app.name

# Getting Application Current Version
puts app.current_version

# Getting Application Price
puts app.price

# Getting Ratting Value
puts app.ratting_value

# Getting  Nr of Votes
puts app.ratting_count

# Getting  Last Update datetime
puts app.updated

# Getting  SDK Required
puts app.sdk_required

# Getting  Download category
puts app.downloads

# Getting  Application Size
puts app.size

# Getting  Content Ratting
puts app.contentRating

# Getting  Application description
puts app.description

# Getting Developer Name
puts app.developer_name

# Getting Icon URL
puts app.icon

# Getting Screenshot URLs Array
puts app.screenshots

# Getting Last Updates Array
puts app.update_text
```

### Get Top selling free app in position (Overall Ranking)

```ruby
require 'rubygems'
require 'android_market_api'

#Overall Position 15 Free Apps
app=AndroidMarket.get_overall_top_selling_free_app(15)

...
```

### Get Top selling paid app in position (Overall Ranking)

```ruby
require 'rubygems'
require 'android_market_api'

#Overall Position 20 Free Apps
app=AndroidMarket.get_overall_top_selling_paid_app(20)

...
```

### Get Top selling paid app in position (Category Ranking)

```ruby
require 'rubygems'
require 'android_market_api'

#Position 10 in Category 'BOOKS_AND_REFERENCE'
app=AndroidMarket.get_top_selling_paid_app_in_category('BOOKS_AND_REFERENCE',10)

....
```

### Get Top selling free app in position (Category Ranking)

```ruby
require 'rubygems'
require 'android_market_api'

#Position 1 in Category COMMUNICATION
app=AndroidMarket.get_top_selling_free_app_in_category('COMMUNICATION',1)

....
```

### Get Game Categories

```ruby
require 'rubygems'
require 'android_market_api'

game_categories_ar=AndroidMarket.get_game_categories

...
```

### Get App Categories

```ruby
require 'rubygems'
require 'android_market_api'

app_categories_ar=AndroidMarket.get_application_categories

...
```

## License and copyright ##

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to
deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## How can i help ?

Contributions are welcome ! The project is mainly missing documentation and examples...



# -*- coding: utf-8 -*-
require 'spec_helper'

describe AndroidMarketApplication do
  before do
    AndroidMarketApplication.debug = 1
  end

  describe "#initialize" do
    subject{ AndroidMarketApplication.new(package, language) }

    let(:package)  { "com.twitter.android" }
    let(:language) { "en" }

    its(:package)         { should == package }
    its(:language)        { should == language }
    its(:name)            { should == "Twitter" }
    its(:current_version) { should_not be_empty }
    its(:price)           { should_not be_empty }
    its(:rating_value)    { should_not be_empty }
    its(:rating_count)    { should_not be_empty }
    its(:updated)         { should_not be_empty }
    its(:sdk_required)    { should_not be_empty }
    its(:category)        { should_not be_empty }
    its(:downloads)       { should_not be_empty }
    its(:size)            { should_not be_empty }
    its(:content_rating)  { should_not be_empty }
    its(:description)     { should_not be_empty }
    its(:screenshots)     { should_not be_empty }
    its(:developer_name)  { should_not be_empty }
    its(:icon)            { should_not be_empty }
    its(:update_text)     { should_not be_empty }
  end
end
# -*- coding: utf-8 -*-
require 'spec_helper'

describe AndroidMarketApplication do
  before(:all) do
    AndroidMarketApplication.debug = false
  end

  describe "#initialize" do
    subject{ AndroidMarketApplication.new(package, language) }

    let(:package)  { "com.twitter.android" }
    let(:language) { "en" }

    its(:package)         { should == package }
    its(:language)        { should == language }
    its(:name)            { should == "Twitter" }
    its(:developer_name)  { should == "Twitter, Inc." }
    its(:current_version) { should     be_an_instance_of String }
    its(:current_version) { should_not be_empty }
    its(:price)           { should_not be_empty }
    its(:price)           { should     be_an_instance_of String }
    its(:rating_value)    { should_not be_empty }
    its(:rating_value)    { should     be_an_instance_of String }
    its(:rating_count)    { should_not be_empty }
    its(:rating_count)    { should     be_an_instance_of String }
    its(:updated)         { should_not be_empty }
    its(:updated)         { should     be_an_instance_of String }
    its(:sdk_required)    { should_not be_empty }
    its(:sdk_required)    { should     be_an_instance_of String }
    its(:category)        { should_not be_empty }
    its(:category)        { should     be_an_instance_of String }
    its(:downloads)       { should_not be_empty }
    its(:downloads)       { should     be_an_instance_of String }
    its(:size)            { should_not be_empty }
    its(:size)            { should     be_an_instance_of String }
    its(:content_rating)  { should_not be_empty }
    its(:content_rating)  { should     be_an_instance_of String }
    its(:description)     { should_not be_empty }
    its(:description)     { should     be_an_instance_of String }
    its(:screenshots)     { should_not be_empty }
    its(:screenshots)     { should     be_an_instance_of Array }
    its(:icon)            { should_not be_empty }
    its(:icon)            { should     be_an_instance_of String }
    its(:update_text)     { should_not be_empty }
    its(:update_text)     { should     be_an_instance_of String }
  end
end

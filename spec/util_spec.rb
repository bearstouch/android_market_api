# -*- coding: utf-8 -*-
require 'spec_helper'

describe AndroidMarketApi::Util do

  describe "#sanitize" do
    subject { AndroidMarketApi::Util.sanitize(str) }

    let(:str) { "aaa<br>bbb<br/>ccc<p>ddd</p>eee<br />" }

    it "should sanitize" do
      should == <<EOS
aaa
bbb
ccc ddd eee
EOS
    end
  end

end
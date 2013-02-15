# -*- coding: utf-8 -*-
require 'spec_helper'

describe AndroidMarket do

  describe "#get_application_categories" do
    subject { AndroidMarket.get_application_categories }

    it{ should have_at_least(1).items }
    it{ should include "BOOKS_AND_REFERENCE" }
  end
end
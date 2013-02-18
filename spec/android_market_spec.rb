# -*- coding: utf-8 -*-
require 'spec_helper'

describe AndroidMarket do

  describe "#get_application_categories" do
    subject { AndroidMarket.get_application_categories }

    it{ should have_at_least(1).items }
    it{ should include "BOOKS_AND_REFERENCE" }
  end

  describe "#get_languages" do
    subject { AndroidMarket.get_languages }

    it{ should have_at_least(1).items }
    it{ should include "en" }
  end

  describe "#get_game_categories" do
    subject { AndroidMarket.get_game_categories }

    it{ should have_at_least(1).items }
    it{ should include "ARCADE" }
  end

  let(:category) { "BOOKS_AND_REFERENCE" }
  let(:position) { 1 }
  let(:language) { "en" }
  let(:developer_name) { "Google Inc." }

  describe "#get_top_selling_free_app_in_category" do
    subject { AndroidMarket.get_top_selling_free_app_in_category(category, position, language) }

    it{ should be_an_instance_of AndroidMarketApplication }
  end

  describe "#get_top_selling_paid_app_in_category" do
    subject { AndroidMarket.get_top_selling_paid_app_in_category(category, position, language) }

    it{ should be_an_instance_of AndroidMarketApplication }
  end

  describe "#get_overall_top_selling_free_app" do
    subject { AndroidMarket.get_overall_top_selling_free_app(position, language) }

    it{ should be_an_instance_of AndroidMarketApplication }
  end

  describe "#get_overall_top_selling_paid_app" do
    subject { AndroidMarket.get_overall_top_selling_paid_app(position, language) }

    it{ should be_an_instance_of AndroidMarketApplication }
  end

  describe "#get_developer_app_list" do
    subject { AndroidMarket.get_developer_app_list(developer_name, position, language) }

    it{ should be_an_instance_of Array }
    its(:first){ should be_an_instance_of AndroidMarketApplication }
  end
end
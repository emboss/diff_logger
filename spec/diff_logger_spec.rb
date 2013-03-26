require 'rspec'
require 'factory_girl'
require 'diff_logger'
require 'support/active_record'

describe DiffLogger do
  
  class Post < ActiveRecord::Base
    include DiffLogger.custom { |changes| @log_cb.call(changes) }

    class << self
      attr_accessor :log_cb
    end
  end

  FactoryGirl.define do
    factory :post do
      title "A"
      body "B"
    end
  end


  describe "::custom" do
    it "should not be triggered when new records are saved" do
      Post.log_cb = lambda do |changes|
        fail
      end

      FactoryGirl.create(:post)
    end

    it "should be triggered when a record is updated and a single value is changed" do
      called = false
      Post.log_cb = lambda do |changes|
        changes[:title].should eq(["A", "B"])
        changes[:body].should be_nil
        called = true
      end

      p = FactoryGirl.create(:post)
      p.title = "B"
      p.save!
      called.should be_true
    end

    it "should not be triggered when a record is updated and the same value is assigned" do
      called = false
      Post.log_cb = lambda do |changes|
        changes.should be_empty
        called = true
      end

      p = FactoryGirl.create(:post)
      p.title = "A"
      p.body = "B"
      p.save!
      called.should be_true
    end

  end
  
end

class FeedsController < ApplicationController
  $favFeeds = Array.new
  def index
    url = "https://www.reddit.com/.rss"
    feed = Feedjira::Feed.fetch_and_parse url

    @title = feed.title
    @feeds = feed.entries

    @feeds.each do |feed|
      Feed.create title: feed.title;
    end
  end

  def fav
    @favFeeds = $favFeeds.push params[:entry_title]
    @favFeeds = @favFeeds.uniq 
  end
end

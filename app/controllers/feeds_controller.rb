class FeedsController < ApplicationController
  def index
    url = "https://www.reddit.com/.rss"
    feed = Feedjira::Feed.fetch_and_parse url
    @title = feed.title
    @feeds = feed.entries
  end
end

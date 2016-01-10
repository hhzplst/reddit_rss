class FeedsController < ApplicationController
  before_action :current_user

  def index
    url = "https://www.reddit.com/.rss"
    feed = Feedjira::Feed.fetch_and_parse url
    feed.entries.each do |feed|
      if !Feed.find_by title: feed.title
        Feed.create title: feed.title;
      end
    end

    @title = feed.title
    @feeds = Feed.all

  end

  def fav
    if @current_user
      current_feed = Feed.find_by_id params[:entry]
      if !@current_user.feeds.index current_feed
        @current_user.feeds << current_feed
      end
      redirect_to fav_path
    else redirect_to login_path
    end
  end

  def all_fav
    @favFeeds = @current_user.feeds
  end
end
require 'net/http'

class UpdateFeedService < ApplicationService
  def initialize(feed)
    @feed = feed
  end

  def parse_feed
    response = Net::HTTP.get(URI(@feed.url))
    rss = SimpleRSS.parse(response)

    @feed.title = rss.channel.title
    @feed.description = rss.channel.description
    @feed.language = rss.channel.try(:language)
    @feed.published_at = rss.channel.try(:pubDate)
    @feed.save!

    items = []
    rss.channel.items.each do |i|
      item = Item.find_or_initialize_by(
        feed: @feed,
        guid: i.guid,
      )

      item.title = i.title
      item.url = i.link
      item.description = i.description
      item.published_at = i.pubDate
      item.category = i.category
      item.comments = i.comments

      items << item
    end
    Item.transaction { items.map(&:save!) }
  end

  def reenqueue_feed_update_job
    UpdateFeedsJob.set(wait: 1.week).perform_later(@feed)
  end
end

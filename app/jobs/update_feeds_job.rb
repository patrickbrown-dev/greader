class UpdateFeedsJob < ApplicationJob
  queue_as :default

  def perform(*feeds)
    feeds.each do |feed|
      service = UpdateFeedService.new(feed)
      begin
        service.parse_feed
      ensure
        service.reenqueue_feed_update_job
      end
    end
  end
end

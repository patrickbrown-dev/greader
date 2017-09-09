=begin
According to the RSS specification https://validator.w3.org/feed/docs/rss2.html

Mandatory Fields
- url
- title
- description

Optional Fields
- language
- published_at
TODO
- lastBuildDate
- generator
- image
- ttl (integer in minutes)
- copyright
- managingEditor
- webMaster
=end

class Feed < ApplicationRecord
  validates :url, uniqueness: true, presence: true
  validates :title, presence: true
  has_many :items, dependent: :destroy
end

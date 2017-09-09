=begin
title
link
description
pubDate
guid
category
comments

dc_creator
content_encoded
=end
class Item < ApplicationRecord
  belongs_to :feed
end

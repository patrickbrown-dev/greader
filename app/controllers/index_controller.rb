class IndexController < ApplicationController
  def index
    @items = Item.order(published_at: :desc).limit(25)
  end
end

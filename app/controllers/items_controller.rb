class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_feed

  # GET /items
  def index
    @items = Item.where(feed: @feed)
  end

  # GET /items/1
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to feed_item_path(@feed, @item), notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to feed_item_path(@feed, @item), notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    redirect_to feed_items_url(@feed), notice: 'Item was successfully destroyed.'
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def set_feed
    @feed = Feed.find(params[:feed_id])
  end

  def item_params
    params.require(:item).permit(:url, :title, :description, :published_at, :guid, :feed_id, :category, :comments)
  end
end

require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
    @feed = feeds(:one)
  end

  test "should get index" do
    get feed_items_url(@feed)
    assert_response :success
  end

  test "should get new" do
    get new_feed_item_url(@feed)
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post feed_items_url(@feed), params: { item: { category: @item.category, comments: @item.comments, description: @item.description, feed_id: @item.feed_id, guid: @item.guid, published_at: @item.published_at, title: @item.title, url: @item.url } }
    end

    assert_redirected_to feed_item_url(@feed, Item.last)
  end

  test "should show item" do
    get feed_item_url(@feed, @item)
    assert_response :success
  end

  test "should get edit" do
    get edit_feed_item_url(@feed, @item)
    assert_response :success
  end

  test "should update item" do
    patch feed_item_url(@feed, @item), params: { item: { category: @item.category, comments: @item.comments, description: @item.description, feed_id: @item.feed_id, guid: @item.guid, published_at: @item.published_at, title: @item.title, url: @item.url } }
    assert_redirected_to feed_item_url(@feed, @item)
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete feed_item_url(@feed, @item)
    end

    assert_redirected_to feed_items_url(@feed)
  end
end

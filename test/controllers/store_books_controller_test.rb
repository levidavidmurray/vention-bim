require "test_helper"

class StoreBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_books_index_url
    assert_response :success
  end
end

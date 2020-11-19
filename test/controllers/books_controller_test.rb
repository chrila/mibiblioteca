require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test 'get books' do
    get books_path
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test 'book create' do
    params = {
      title: "Ruby 101",
      author: "Jane Doe",
      status: 'in_shelf',
      lend_date: DateTime.now,
      return_date: DateTime.now
    }
    post books_url, params: { book: params }
    assert_response :found
  end
end

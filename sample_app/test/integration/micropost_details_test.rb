require 'test_helper'

class MicropostDetailsTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @micropost = microposts(:orange)
  end

  test "micropost details with login" do
    log_in_as(@user)
    get micropost_path(@micropost)

    assert_match @micropost.content, response.body
    assert_match l(@micropost.created_at, :long), response.body
    refute_match 'ago', response.body
    assert_select 'a[href=?]', micropost_path(@micropost), text: 'delete'
  end

  test "micropost details without login" do
    get micropost_path(@micropost)

    refute_match 'delete', response.body
  end

end

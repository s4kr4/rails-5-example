require 'test_helper'

class MicropostDetailsTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @other_user = users(:archer)
    @micropost = microposts(:orange)
    @others_micropost = microposts(:ants)
  end

  test "my micropost with login" do
    log_in_as(@user)
    get micropost_path(@micropost)

    assert_match @micropost.content, response.body
    assert_match l(@micropost.created_at, :long), response.body
    refute_match 'ago', response.body
    assert_select 'a[href=?]', micropost_path(@micropost), text: 'delete'
  end

  test "my micropost without login" do
    get micropost_path(@micropost)

    assert_not response.body.include?(micropost_path(@micropost))
  end

  test "other micropost with login" do
    log_in_as(@user)
    get micropost_path(@others_micropost)

    assert_not response.body.include?(micropost_path(@others_micropost))
  end

  test "other micropost without login" do
    get micropost_path(@micropost)

    assert_not response.body.include?(micropost_path(@micropost))
  end

  test "my micropost with login as other user" do
    log_in_as(@other_user)
    get micropost_path(@micropost)

    assert_not response.body.include?(micropost_path(@micropost))
  end

end

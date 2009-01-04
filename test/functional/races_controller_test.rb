require 'test_helper'

class RacesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:races)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_race
    assert_difference('Race.count') do
      post :create, :race => { }
    end

    assert_redirected_to race_path(assigns(:race))
  end

  def test_should_show_race
    get :show, :id => races(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => races(:one).id
    assert_response :success
  end

  def test_should_update_race
    put :update, :id => races(:one).id, :race => { }
    assert_redirected_to race_path(assigns(:race))
  end

  def test_should_destroy_race
    assert_difference('Race.count', -1) do
      delete :destroy, :id => races(:one).id
    end

    assert_redirected_to races_path
  end
end

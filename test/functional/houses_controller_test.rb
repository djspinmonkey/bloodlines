require 'test_helper'

class HousesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:houses)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_house
    assert_difference('House.count') do
      post :create, :house => { }
    end

    assert_redirected_to house_path(assigns(:house))
  end

  def test_should_show_house
    get :show, :id => houses(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => houses(:one).id
    assert_response :success
  end

  def test_should_update_house
    put :update, :id => houses(:one).id, :house => { }
    assert_redirected_to house_path(assigns(:house))
  end

  def test_should_destroy_house
    assert_difference('House.count', -1) do
      delete :destroy, :id => houses(:one).id
    end

    assert_redirected_to houses_path
  end
end

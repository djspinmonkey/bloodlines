require 'test_helper'

class MarriagesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:marriages)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_marriage
    assert_difference('Marriage.count') do
      post :create, :marriage => { }
    end

    assert_redirected_to marriage_path(assigns(:marriage))
  end

  def test_should_show_marriage
    get :show, :id => marriages(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => marriages(:one).id
    assert_response :success
  end

  def test_should_update_marriage
    put :update, :id => marriages(:one).id, :marriage => { }
    assert_redirected_to marriage_path(assigns(:marriage))
  end

  def test_should_destroy_marriage
    assert_difference('Marriage.count', -1) do
      delete :destroy, :id => marriages(:one).id
    end

    assert_redirected_to marriages_path
  end
end

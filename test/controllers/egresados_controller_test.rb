require 'test_helper'

class EgresadosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get egresados_index_url
    assert_response :success
  end

  test "should get new" do
    get egresados_new_url
    assert_response :success
  end

  test "should get show" do
    get egresados_show_url
    assert_response :success
  end

  test "should get edit" do
    get egresados_edit_url
    assert_response :success
  end

end

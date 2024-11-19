require 'test_helper'

class TurkeysControllerTest < ActionDispatch::IntegrationTest
  def setup
    @turkey = Turkey.create(name: "Tom", age: 5, weight: 15.0, sex: 'male', species: 'Rio Grande Turkey', status: 'wild')
  end

  test 'should update turkey with valid parameters' do
    patch turkey_url(@turkey), params: { turkey: { name: "Tommy", age: 5, weight: 15.0, sex: 'male', species: 'Rio Grande Turkey', status: 'wild' } }
    @turkey.reload
    assert_equal 'Tommy', @turkey.name
    assert_redirected_to turkey_path(@turkey) # Expect redirect to the show page
    assert_equal 'Turkey was successfully updated.', flash[:notice]
  end

  test 'should not update turkey with invalid parameters' do
    patch turkey_url(@turkey), params: { turkey: { name: '', sex: 'Male', species: 'Wild Turkey' } }
    @turkey.reload
    assert_equal 'Tom', @turkey.name
    assert_template :edit
  end

  test 'should destroy turkey' do
    assert_difference('Turkey.count', -1) do
      delete turkey_url(@turkey)
    end
    assert_redirected_to turkeys_path
    assert_equal 'Turkey was successfully destroyed.', flash[:notice]
  end
end

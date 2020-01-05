require 'test_helper'

class AdminsBackoffice::SubjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_backoffice_subjects_index_url
    assert_response :success
  end

end

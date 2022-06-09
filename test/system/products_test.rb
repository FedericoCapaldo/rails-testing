require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  # def test_visiting_the_index do # equivalent syntax of test method signature
  test "visiting the index" do
    visit root_url # "/"

    save_and_open_screenshot
    assert_selector "h1", text: "Awesome Products"
  end
end
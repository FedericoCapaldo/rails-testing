require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  # def test_visiting_the_index do # equivalent syntax of test method signature
  test "visiting the index" do
    visit root_url # "/"

    assert_selector "h1", text: "Awesome Products"
  end

  test "display as many cards in index as in Product db" do
    visit root_url # "/"

    assert_selector ".card-product", count: Product.count
  end


  test "let a signed in user create a new product" do
    login_as users(:george) # Warden Helper function login_as
    visit "/products/new"

    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"

    click_on "Create Product"

    assert_text "Change your life: Learn to code"
  end
end

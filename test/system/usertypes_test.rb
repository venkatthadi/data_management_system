require "application_system_test_case"

class UsertypesTest < ApplicationSystemTestCase
  setup do
    @usertype = usertypes(:one)
  end

  test "visiting the index" do
    visit usertypes_url
    assert_selector "h1", text: "Usertypes"
  end

  test "creating a Usertype" do
    visit usertypes_url
    click_on "New Usertype"

    fill_in "Name", with: @usertype.name
    click_on "Create Usertype"

    assert_text "Usertype was successfully created"
    click_on "Back"
  end

  test "updating a Usertype" do
    visit usertypes_url
    click_on "Edit", match: :first

    fill_in "Name", with: @usertype.name
    click_on "Update Usertype"

    assert_text "Usertype was successfully updated"
    click_on "Back"
  end

  test "destroying a Usertype" do
    visit usertypes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Usertype was successfully destroyed"
  end
end

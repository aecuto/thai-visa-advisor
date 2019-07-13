require "application_system_test_case"

class MembersTest < ApplicationSystemTestCase
  setup do
    @member = members(:one)
  end

  test "visiting the index" do
    visit members_url
    assert_selector "h1", text: "Members"
  end

  test "creating a Member" do
    visit members_url
    click_on "New Member"

    fill_in "Dob", with: @member.dob
    fill_in "Doe", with: @member.doe
    fill_in "Full name", with: @member.full_name
    fill_in "Noti90", with: @member.noti90
    fill_in "Passport exp", with: @member.passport_exp
    fill_in "Visa exp", with: @member.visa_exp
    fill_in "Wp exp", with: @member.wp_exp
    click_on "Create Member"

    assert_text "Member was successfully created"
    click_on "Back"
  end

  test "updating a Member" do
    visit members_url
    click_on "Edit", match: :first

    fill_in "Dob", with: @member.dob
    fill_in "Doe", with: @member.doe
    fill_in "Full name", with: @member.full_name
    fill_in "Noti90", with: @member.noti90
    fill_in "Passport exp", with: @member.passport_exp
    fill_in "Visa exp", with: @member.visa_exp
    fill_in "Wp exp", with: @member.wp_exp
    click_on "Update Member"

    assert_text "Member was successfully updated"
    click_on "Back"
  end

  test "destroying a Member" do
    visit members_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Member was successfully destroyed"
  end
end

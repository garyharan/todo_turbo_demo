require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "should create item" do
    visit items_url
    find("#item_body").set("This is a test item with return key")
    find('#item_body').native.send_keys(:return)

    assert_text "This is a test item with return key"
  end

  test "should destroy Item" do
    visit items_url

    find("#item_body").set("This is an item I will delete")
    find('#item_body').native.send_keys(:return)

    assert_text "This is an item I will delete"

    within("#items") do
      all('button').last.click
    end
    assert_no_text "This is an item I will delete"
  end
end

require "test_helper"

class NineToFiveTest < ActionDispatch::IntegrationTest
  test "it has a version number" do
    assert NineToFive::VERSION
  end

  test "during business hours" do
    travel_to Time.current.change(hour: NineToFive.start_hour, minutes: 5) do
      get "/"
      assert_response 200
      assert_equal "My Application", response.body
    end
  end

  test "before business hours" do
    travel_to Time.current.change(hour: NineToFive.start_hour - 1) do
      get "/"
      assert_response 403
    end
  end

  test "after business hours" do
    travel_to Time.current.change(hour: NineToFive.end_hour + 1) do
      get "/"
      assert_response 403
    end
  end
end

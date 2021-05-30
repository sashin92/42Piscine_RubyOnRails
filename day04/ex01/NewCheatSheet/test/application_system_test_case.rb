require "test_helper"

# To create a system test in your application, extend your test class from ApplicationSystemTestCase.
class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end

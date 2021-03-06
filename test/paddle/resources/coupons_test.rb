require "test_helper"

class CouponsResourceTest < Minitest::Test

  def test_list
    stub = stub_request("2.0/product/list_coupons", response: "coupons/list")
    client = Paddle::Client.new(vendor_id: "123", vendor_auth_code: "abc", adapter: :test, stubs: stub)

    coupons = client.coupons.list(product_id: "123")

    assert_equal Paddle::Coupon, coupons.data.first.class
    assert_equal "56604810a6990", coupons.data.first.coupon
  end

end

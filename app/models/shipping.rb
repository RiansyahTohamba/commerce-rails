class Shipping
  belongs_to :order
  belongs_to :shipper

  def calculate_shipping_cost(city_to)
      shipper_service = ThirdPartyShippingService.new(shipper.api_credentials)
      shipper_service.get_cost(city_to)
  end
end
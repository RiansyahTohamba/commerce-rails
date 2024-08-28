require 'rails_helper'

RSpec.describe Shipping, type: :model do
  let(:order) { instance_double('Order') }
  let(:item_cost) { 80000 }
  let(:jne_kdi_cost) { 70000 }
  let(:chosen_carrier)  {'JNE'}
  let(:chosen_city)  {'KENDARI'}

  before do
    Shipping.create(carrier: 'JNE', city: 'KENDARI', cost: 70000)
    Shipping.create(carrier: 'JNE', city: 'PALEMBANG', cost: 10000)
    Shipping.create(carrier: 'ANTERAJA', city: 'PALEMBANG', cost: 8000)
    allow(order).to receive(:calculate)
      .with(item_cost,chosen_carrier,chosen_city)
      .and_return((item_cost+jne_kdi_cost))
  end

  specify 'total cost will be change based on shipping address & type' do
    total_cost = order.calculate(item_cost,chosen_carrier,chosen_city)
    shp_cos = Shipping.find_by(city: chosen_city,carrier: chosen_carrier).cost
    expect(total_cost).to eq((item_cost+shp_cos))
  end
end

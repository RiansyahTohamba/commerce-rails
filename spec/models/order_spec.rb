require 'rails_helper'

RSpec.describe Order, type: :model do
  # order_status = Order  
  describe 'state machine of order' do
    let(:pending_order) { create(:order, :pending) }
    let(:paid_order) { create(:order, :paid) }
    let(:shipped_order) { create(:order, :shipped) }

    # let(:item_prev_stock) { Item.find_by(id: 10).stock }
    before do
      
    end

    it 'create order with state=PENDING' do
    end

    it 'create order with state=PAID' do
      # recent_stock = item.item_prev_stock - order.qty
      # expect(recent_stock).eq (10)
    end

    it 'create order with state=CANCELED' do
      # order_status = 1
      # expect(order_status).to eq()
    end

    it 'create order with state=DENIED' do
    end
    
    it 'create order with state=EXPIRED' do
    end
    
  end
  
  describe 'calculation of total price that involved Shipping' do
    let(:order) { instance_double('Order') }
    let(:item_cost) { 80000 }
    let(:jne_kdi_cost) { 70000 }
    let(:chosen_carrier)  {'JNE'}
    let(:chosen_city)  {'KENDARI'}
  
    before do
      Shipping.create(carrier: 'JNE', city: 'KENDARI', cost: 70000)
      Shipping.create(carrier: 'JNE', city: 'PALEMBANG', cost: 10000)
      Shipping.create(carrier: 'ANTERAJA', city: 'PALEMBANG', cost: 8000)
      allow(order).to receive(:calculate_total_price)
        .with(item_cost,chosen_carrier,chosen_city)
        .and_return((item_cost+jne_kdi_cost))
    end
  
    specify 'total cost will be change based on shipping address & type' do
      total_cost = order.calculate_total_price(item_cost,chosen_carrier,chosen_city)
      shp_cos = Shipping.find_by(city: chosen_city,carrier: chosen_carrier).cost
      expect(total_cost).to eq((item_cost+shp_cos))
    end  
  end
end

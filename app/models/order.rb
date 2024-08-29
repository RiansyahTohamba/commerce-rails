# require 'state_machines/order_state_machine'
class Order < ApplicationRecord
  include AASM
  has_many :line_items
  
  def checkout
    l_it = LineItem.new
    od.status = 'pending'
    od.total_price = item.price * qty
    od.line_items << l_it
    od.saved!
  end

  def process_payment
    ActiveRecord::Base.transaction do
      line_items.each do |line|
        item = line.item
        item.update!(stock: item.stock - line.quantity)
      end
      pay!
    end
  end

  def total_price
    line_items.to_a.sum(&:total_price)
  end
  
  # def total_price(item_cost,chosen_carrier,chosen_city)
  #   # shp_address = User.find_by(id: params(user_id), option_adr:params(chosen_address))
  # end

  aasm column: 'status' do
    state :pending, initial: true                  
    state :paid, :shipped, :completed, :canceled, :expired

    event :pay do                                     
      transitions from: :pending, to: :paid
      after { @status = aasm.current_state }
    end

    event :ship do 
      transitions from: :pending, to: :paid
      after { @status = aasm.current_state }
    end

    event :complete do
      transitions from: :shipped, to: :completed
      after { @status = aasm.current_state }
    end

    event :cancel do
      transitions from: [:pending, :paid], to: :canceled
      after { @status = aasm.current_state }
    end

    event :expire do
      transitions from: :pending, to: :expired
      after { @status = aasm.current_state }
    end
  end
end
# bagaimana cara pakai method total_price ini?
# saat user sudah melakukan checkout, user diberikan data berikut:
# 1. alamat pengiriman default sudah dipilih, tetapi ia bisa di ubah lagi
# 2. pilihan kurir tersedia (carrier tables)

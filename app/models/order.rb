class Order < ApplicationRecord
  def calculate_total_price(item_cost,chosen_carrier,chosen_city)
    # shp_address = User.find_by(id: params(user_id), option_adr:params(chosen_address))

  end
end
# bagaimana cara pakai method total_price ini?
# saat user sudah melakukan checkout, user diberikan data berikut:
# 1. alamat pengiriman default sudah dipilih, tetapi ia bisa di ubah lagi
# 2. pilihan kurir tersedia (carrier tables)

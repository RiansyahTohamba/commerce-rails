PENDING	
PAID	
CANCELED	
DENIED	
EXPIRED	



# PENDING	
user has not completed the payment
{
    "orderId": "1461906891936366594",
    "partnerOrderId": "REF-8888",
    "partnerOrderAmount": "72000000",
    "orderStatus": "PENDING",
    "orderStatusDesc": "payment pending",
    "paymentEntryUrl": "https://test-pay.akulaku.com/KKCbiAy01OqHNz2gco23e",
    "metadata": "",
    "createTime": "2021-09-15T12:10:00.753Z"
}

# PAID	
payment is successful

{
    "orderId": "1461906891936366594",
    "partnerOrderId": "REF-8888",
    "partnerOrderAmount": "72000000",
    "orderStatus": "PAID",
    "orderStatusDesc": "payment completed",
    "paymentEntryUrl": "https://test-pay.akulaku.com/KKCbiAy01OqHNz2gco23e",
    "metadata": "",
    "createTime": "2021-09-15T12:10:00.753Z"
}

# CANCELED	
payment canceled

{
    "orderId": "1461906891936366594",
    "partnerOrderId": "REF-8888",
    "partnerOrderAmount": "72000000",
    "orderStatus": "CANCELED",
    "orderStatusDesc": "payment canceled",
    "paymentEntryUrl": "https://test-pay.akulaku.com/KKCbiAy01OqHNz2gco23e",
    "metadata": "",
    "createTime": "2021-09-15T12:10:00.753Z",
    "reason": {
        "code": "CreditBalanceNotEnough",
        "message": "credit balance not enough"
    }
}

# DENIED	
payment has been denied by Akulaku PayLater

# EXPIRED	
user did not complete the payment, thus payment is expired

# command rails scaffold
rails g scaffold Order user_id:integer status:integer total_price:decimal

# tugas selanjutnya
1. harus buat page untuk item
2. lalu setelah itu bisa kita lakukan order
3. lalu lakukan checkout dan order berubah jadi pending


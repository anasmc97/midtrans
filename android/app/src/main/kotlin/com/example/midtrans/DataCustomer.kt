package com.example.midtrans;

import com.midtrans.sdk.corekit.core.TransactionRequest
import com.midtrans.sdk.corekit.models.BankType
import com.midtrans.sdk.corekit.models.CustomerDetails
import com.midtrans.sdk.corekit.models.ItemDetails
import com.midtrans.sdk.corekit.models.snap.CreditCard

object DataCustomer {
    var NAME = "kodetr"
    var PHONE = "08712345678"
    var EMAIL = "beruang@gmail.com"

    fun customerDetails(): CustomerDetails {
        var cd = CustomerDetails()
        cd.firstName = NAME
        cd.phone = PHONE
        cd.email = EMAIL
        return cd
    }

    fun transactionRequest(id: String?, price: Int, qty: Int, name: String?): TransactionRequest{
        val request = TransactionRequest(System.currentTimeMillis().toString()+" ", 20000.0)
        request.setCustomerDetails(customerDetails())
        val details = ItemDetails(id,price.toDouble(),qty,name)
        val itemDetails = ArrayList<ItemDetails>()
        itemDetails.add(details)
        request.itemDetails = itemDetails
        val creditCard = CreditCard()
        creditCard.isSaveCard = false
        creditCard.authentication = CreditCard.AUTHENTICATION_TYPE_RBA
        creditCard.bank = BankType.MANDIRI
        request.creditCard = creditCard
        return request
    }
}

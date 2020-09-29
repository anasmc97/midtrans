package com.example.midtrans

import android.annotation.SuppressLint
import android.os.Bundle
import android.widget.Toast
import androidx.annotation.NonNull
import com.example.midtrans.BuildConfig.MERCHANT_BASE_URL
import com.midtrans.sdk.corekit.callback.TransactionFinishedCallback
import com.midtrans.sdk.corekit.core.MidtransSDK
import com.midtrans.sdk.corekit.core.PaymentMethod
import com.midtrans.sdk.corekit.core.themes.CustomColorTheme
import com.midtrans.sdk.corekit.models.snap.TransactionResult
import com.midtrans.sdk.uikit.SdkUIFlowBuilder
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity(), TransactionFinishedCallback{
    companion object {
        const val CHANNEL = "com.kodetr.kodetr_app.channel"
        const val KEY_NATIVE = "showPaymentGateway"
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            // Note: this method is invoked on the main thread.
            if(call.method.equals(KEY_NATIVE)){
                val name = (""+call.argument("name"))
                val price = (""+call.argument("price")).toInt()
                val qty = (""+call.argument("quantity")).toInt()

                initMidtransSdk()

                MidtransSDK.getInstance().transactionRequest = DataCustomer.transactionRequest(
                        "1",
                        price,
                        qty,
                        name
                )
                MidtransSDK.getInstance().startPaymentUiFlow(this, PaymentMethod.GO_PAY)
            }else{
                result.notImplemented()
            }
        }
    }

    
//    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
//        super.configureFlutterEngine(flutterEngine)
//
//        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler(MethodChannel.MethodCallHandler { call, result ->
//            if(call.method.equals(KEY_NATIVE)){
//                val name = (""+call.argument("name"))
//                val price = (""+call.argument("price")).toInt()
//                val qty = (""+call.argument("quantity")).toInt()
//
//                initMidtransSdk()
//
//                MidtransSDK.getInstance().transactionRequest = DataCustomer.transactionRequest(
//                        "1",
//                        price,
//                        qty,
//                        name
//                )
//                MidtransSDK.getInstance().startPaymentUiFlow(this)
//            }else{
//                result.notImplemented()
//            }
//        })
//    }

    private fun initMidtransSdk(){
        SdkUIFlowBuilder.init()
                .setContext(this)
                .setMerchantBaseUrl(BuildConfig.MERCHANT_BASE_URL)
                .setClientKey(BuildConfig.MERCHANT_CLIENT_KEY)
                .setTransactionFinishedCallback(this)
                .enableLog(true)
                .setColorTheme(CustomColorTheme("#87CEFA", "#87CEFA", "#87CEFA"))
                .buildSDK()
    }

    @SuppressLint("ShowToast")
    override fun onTransactionFinished(result: TransactionResult) {
        if(result.response != null){
            when (result.status){
                TransactionResult.STATUS_SUCCESS -> Toast.makeText(this, "Transaction Finished ID: " + result.response.transactionId, Toast.LENGTH_SHORT)
                TransactionResult.STATUS_PENDING -> Toast.makeText(this, "Transaction PENDING ID: " + result.response.transactionId, Toast.LENGTH_SHORT)
                TransactionResult.STATUS_FAILED -> Toast.makeText(this, "Transaction Failed ID: " + result.response.transactionId, Toast.LENGTH_SHORT)
            }
            result.response.validationMessages
        }else if (result.isTransactionCanceled){
            Toast.makeText(this, "Transaction Canceled", Toast.LENGTH_SHORT)
        }else if (result.status.equals(TransactionResult.STATUS_INVALID, ignoreCase = true)){
            Toast.makeText(this, "Transaction Invalid", Toast.LENGTH_SHORT)
        }else{
            Toast.makeText(this, "Transaction Finished with failure", Toast.LENGTH_SHORT)
        }
    }


//    override fun onCreate(savedInstanceState: Bundle?) {
//        super.onCreate(savedInstanceState)
//        GeneratedPluginRegistrant.registerWith(this )
//        
//        MethodChannel(flutterView, CHANNEL).setMethodCallHandler{call, result ->
//            if(call.method == KEY_NATIVE){
//                
//            }
//        }
//
//    }
}

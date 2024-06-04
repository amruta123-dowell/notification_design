package com.example.flutter_application
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(FlutterEngine(this))

        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
            if (call.method == "loadCustomLayout") {
                // Load the XML layout file and return layout information
                val layoutInfo = loadLayoutInfo()
                result.success(layoutInfo)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun loadLayoutInfo(): String {
        // Implement loading XML layout file and return layout information
        return "Custom layout information"
    }

    companion object {
        private const val CHANNEL = "com.example/custom_layout"
    }
}


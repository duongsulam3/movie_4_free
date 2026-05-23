package com.custom.simpleflix

import android.view.WindowManager
import android.app.Activity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

class CustomVideoPlayerPlugin: FlutterPlugin, NativeWakelockApi, ActivityAware {
    private var activity: Activity? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        NativeWakelockApi.setUp(flutterPluginBinding.binaryMessenger, this)
    }

    override fun toggleWakelock(enable: Boolean) {
        activity?.let { act ->
            if (enable) {
                act.window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
            } else {
                act.window.clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        NativeWakelockApi.setUp(binding.binaryMessenger, null)
    }

    // Các hàm bắt buộc từ ActivityAware để lấy ngữ cảnh Activity an toàn, tránh Memory Leak
    override fun onAttachedToActivity(binding: ActivityPluginBinding) { activity = binding.activity }
    override fun onDetachedFromActivityForConfigChanges() { activity = null }
    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) { activity = binding.activity }
    override fun onDetachedFromActivity() { activity = null }
}
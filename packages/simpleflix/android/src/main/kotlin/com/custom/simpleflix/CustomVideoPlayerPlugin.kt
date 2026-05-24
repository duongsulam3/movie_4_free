package com.custom.simpleflix

import android.view.WindowManager
import android.app.Activity
import android.content.Context
import android.media.AudioManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

class CustomVideoPlayerPlugin: FlutterPlugin, NativeWakelockApi, NativeBrightnessApi, NativeVolumeApi, ActivityAware {
    private var activity: Activity? = null
    private var context: Context? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        NativeWakelockApi.setUp(flutterPluginBinding.binaryMessenger, this)
        NativeBrightnessApi.setUp(flutterPluginBinding.binaryMessenger, this)
        NativeVolumeApi.setUp(flutterPluginBinding.binaryMessenger, this)
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

    override fun setBrightness(brightness: Double) {
        activity?.let { act ->
            val layoutParams = act.window.attributes
            layoutParams.screenBrightness = brightness.toFloat()
            act.window.attributes = layoutParams
        }
    }

    override fun getBrightness(): Double {
        return activity?.let { act ->
            val brightness = act.window.attributes.screenBrightness
            if (brightness < 0) {
                // Nếu là giá trị mặc định hệ thống (-1), trả về giá trị xấp xỉ từ System Settings nếu cần
                // Tuy nhiên trong video player thường chỉ cần quản lý tương đối
                0.5 
            } else {
                brightness.toDouble()
            }
        } ?: 0.5
    }

    override fun setVolume(volume: Double) {
        val audioManager = context?.getSystemService(Context.AUDIO_SERVICE) as? AudioManager
        audioManager?.let { am ->
            val maxVolume = am.getStreamMaxVolume(AudioManager.STREAM_MUSIC)
            val index = (volume * maxVolume).toInt()
            am.setStreamVolume(AudioManager.STREAM_MUSIC, index, 0)
        }
    }

    override fun getVolume(): Double {
        val audioManager = context?.getSystemService(Context.AUDIO_SERVICE) as? AudioManager
        return audioManager?.let { am ->
            val maxVolume = am.getStreamMaxVolume(AudioManager.STREAM_MUSIC)
            val currentVolume = am.getStreamVolume(AudioManager.STREAM_MUSIC)
            currentVolume.toDouble() / maxVolume.toDouble()
        } ?: 0.5
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        NativeWakelockApi.setUp(binding.binaryMessenger, null)
        NativeBrightnessApi.setUp(binding.binaryMessenger, null)
        NativeVolumeApi.setUp(binding.binaryMessenger, null)
        context = null
    }

    // Các hàm bắt buộc từ ActivityAware để lấy ngữ cảnh Activity an toàn, tránh Memory Leak
    override fun onAttachedToActivity(binding: ActivityPluginBinding) { activity = binding.activity }
    override fun onDetachedFromActivityForConfigChanges() { activity = null }
    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) { activity = binding.activity }
    override fun onDetachedFromActivity() { activity = null }
}
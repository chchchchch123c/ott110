package kr.mad.ott.ott110

import android.net.ConnectivityManager
import android.net.Network
import android.os.Build
import android.widget.Toast
import androidx.annotation.RequiresApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    lateinit var methodChannel: MethodChannel

    @RequiresApi(Build.VERSION_CODES.N)
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        methodChannel =
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "kr.mad.ott.ott110")

        methodChannel.setMethodCallHandler { call, result ->
            if (call.method == "toast") {
                Toast.makeText(this, call.arguments as String, Toast.LENGTH_SHORT).show()
                result.success(true)
            }
        }
        val connManager = getSystemService(ConnectivityManager::class.java)

        connManager.registerDefaultNetworkCallback(object : ConnectivityManager.NetworkCallback() {
            override fun onAvailable(network: Network) {
                super.onAvailable(network)
                runOnUiThread { // 스레드 무조건 생성
                    if (connManager.activeNetworkInfo?.type == ConnectivityManager.TYPE_WIFI) {
                        methodChannel.invokeMethod("wifi_status_change", true)
                    } else {
                        methodChannel.invokeMethod("wifi_status_change", false)
                    }
                }
            }

            override fun onLost(network: Network) {
                super.onLost(network)
                runOnUiThread {
                    methodChannel.invokeMethod("wifi_status_change", false)
                }
            }
        })
    }
}

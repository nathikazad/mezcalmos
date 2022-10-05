package <mez-package-name>
import android.app.NotificationManager
import android.content.Context
import io.flutter.embedding.android.FlutterActivity
<kt_imports>

class MainActivity: <kt_super>() {
  override fun onResume() {
      super.onResume()
      closeAllNotifications();
  }

  private fun closeAllNotifications() {
      val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
      notificationManager.cancelAll()
  }

}

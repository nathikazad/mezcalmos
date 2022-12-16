import 'package:mezcalmos/WebApp/routes/deferred_loader.dart';
import 'package:mezcalmos/WebApp/screens/notificationScreen/notificationScreenForMobile.dart'
    deferred as notifs;
import 'package:qlevar_router/qlevar_router.dart';

class NotificationsRoutes {
  static const String notifications = "notifications";

  final routes = QRoute(
    path: "/" + notifications,
    name: notifications,
    middleware: [DefferedLoader(notifs.loadLibrary)],
    builder: () => notifs.NotificationScreenForMobile(),
    // children: [
    //   QRoute(
    //     path: "/:orderId",
    //     name: orderById,
    //     middleware: [DefferedLoader(orderViewScreen.loadLibrary)],
    //     builder: () => orderViewScreen.OrderViewScreen(),
    // )
    // ]
  );
}

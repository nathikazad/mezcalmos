import 'package:mezcalmos/WebApp/routes/Deferred_loader.dart';
import 'package:mezcalmos/WebApp/screens/notificationScreen/notificationPopUpWidget.dart'
    deferred as notifs;
import 'package:qlevar_router/qlevar_router.dart';

class MessagesRoutes {
  static const String message = "messages/:chatId";

  final routes = QRoute(
    path: "/messages/:chatId",
    name: message,
    middleware: [DefferedLoader(notifs.loadLibrary)],
    builder: () => notifs.NotificationPopUpWidget(),
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

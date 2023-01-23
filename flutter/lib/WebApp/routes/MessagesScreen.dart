import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/WebApp/routes/Deferred_loader.dart';
import 'package:mezcalmos/WebApp/screens/Messages/MessagingScreenForWeb.dart'
    deferred as messagingScreen;
import 'package:qlevar_router/qlevar_router.dart';

class MessagesRoutes {
  static const String message = "messages/:chatId";

  final routes = QRoute(
    path: "/messages/:chatId",
    name: message,
    middleware: [DefferedLoader(messagingScreen.loadLibrary)],
    builder: () => messagingScreen.MessagingView(),
    // children: [
    //   QRoute(
    //     path: "/:orderId",
    //     name: orderById,
    //     middleware: [DefferedLoader(orderViewScreen.loadLibrary)],
    //     builder: () => orderViewScreen.OrderViewScreen(),
    // )
    // ]
  );

  static String getMessagesRoute(
      {required String chatId,
      String? orderLink,
      String? orderId,
      OrderType? orderType,
      ParticipantType recipientType = ParticipantType.Customer,
      String? recipientId}) {
    String mainUrl = message.replaceFirst(":chatId", chatId);

    if (recipientId != null)
      mainUrl += "?recipientId=$recipientId";
    else
      mainUrl += "?recipientType=${recipientType.toFirebaseFormattedString()}";
    if (orderLink != null) mainUrl += "&orderLink=$orderLink";
    if (orderId != null) mainUrl += "&orderId=$orderId";
    if (orderType != null)
      mainUrl += "&orderType=${orderType.toFirebaseFormatString()}";
    return mainUrl;
  }
}

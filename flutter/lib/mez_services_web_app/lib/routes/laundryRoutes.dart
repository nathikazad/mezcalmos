import 'package:mez_services_web_app/screens/Laundries/LaundryView/laundryView.dart';
import 'package:mez_services_web_app/screens/Laundries/laundryListView/LaundryListView.dart';
import 'package:qlevar_router/qlevar_router.dart';

class LaundryRoutes {
  static const String laundries = "laundries";
  static const String item_id = "item_id";

  final routes = QRoute(
      // this will define how to find this route with [QR.to]
      path: '/laundries',
      // this will define how to find this route with [QR.toName]
      name: laundries,
      // The page to show when this route is called
      builder: () => LaundryListView(),
      children: [
        QRoute(
          path: '/:itemId',
          name: item_id,
          middleware: [],
          builder: () => LaundryView(),
        )
      ]);
}

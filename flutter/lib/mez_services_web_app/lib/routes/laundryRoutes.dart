import 'package:mez_services_web_app/screens/Laundries/laundryListView/LaundryListView.dart';
import 'package:qlevar_router/qlevar_router.dart';

class LaundryRoutes {
  static const String laundries = "laundries";

  final routes = QRoute(
    // this will define how to find this route with [QR.to]
    path: '/laundries',
    // this will define how to find this route with [QR.toName]
    name: laundries,
    // The page to show when this route is called
    builder: () => LaundryListView(),
  );
}

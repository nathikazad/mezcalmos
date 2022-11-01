import 'package:mez_services_web_app/routes/deferred_loader.dart';
import 'package:mez_services_web_app/screens/Laundries/LaundryView/laundryView.dart'
    deferred as laundryView;
import 'package:mez_services_web_app/screens/Laundries/laundryListView/LaundryListView.dart'
    deferred as laundryList;
import 'package:qlevar_router/qlevar_router.dart';

class LaundryRoutes {
  static const String laundries = "laundries";
  static const String item_id = "id";

  final routes = QRoute(
      // this will define how to find this route with [QR.to]
      path: '/laundries',
      // this will define how to find this route with [QR.toName]
      name: laundries,
      // The page to show when this route is called
      builder: () => laundryList.LaundryListView(),
      middleware: [
        DefferedLoader(laundryList.loadLibrary)
      ],
      children: [
        QRoute(
          // Todo ID
          path: '/:id',
          name: item_id,
          middleware: [DefferedLoader(laundryView.loadLibrary)],
          builder: () => laundryView.LaundryView(),
        )
      ]);
}

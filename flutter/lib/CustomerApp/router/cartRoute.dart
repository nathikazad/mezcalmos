import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/CartViewPage/cart_view_page.dart'
    deferred as cartViewPage;

class CartRoute {
  static String cartViewRoute = "/cartView";

  final List<QRoute> routes = [
    QRoute(
        name: cartViewRoute,
        path: cartViewRoute,
        builder: () => cartViewPage.CartViewPage(),
        middleware: <QMiddleware>[
          DefferedLoader(cartViewPage.loadLibrary),
        ]),
  ];
}

import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/CustCartView.dart'
    deferred as viewCart;
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustItemView/CustItemView.dart'
    deferred as cartItemView;
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustItemView/controllers/CustItemViewController.dart'
    deferred as cartViewController;
import 'package:qlevar_router/qlevar_router.dart';

class CartRoutes {
  static const String cart = '/cart';
  static const String cartItem = '/cart/cartItemId';

  String getCartItemRoute(int cartItemId) => '$cart/$cartItemId';

  final routes = QRoute(
      path: cart,
      name: cart,
      builder: () => viewCart.ViewCartScreen(),
      children: [
        QRoute(
            path: cartItem,
            name: cartItem,
            builder: () => cartItemView.CustItemView(
                viewItemScreenMode:
                    cartViewController.ViewItemScreenMode.EditItemMode)),
      ]);
}

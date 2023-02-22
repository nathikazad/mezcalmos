import 'package:get/get.dart'; // getX
import 'package:mezcalmos/DeliveryApp/pages/DeliveryWrapper.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrderDetails/OrderDetailsScreen.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/CurrentOrdersListScreen.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/PastOrdersView.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/DvOrderView.dart';
import 'package:mezcalmos/DeliveryApp/pages/Unauthorized/UnAuthrizedDriverView.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';

class DeliveryAppRoutes {
  static const String kCurrentOrdersListRoute = '/orders';
  static const String kLaundryOrderView = '/laundryOrders/:orderId';
  static const String kRestaurantOrderView = '/restaurantOrders/:orderId';
  static const String kOrderDetailsView = "/orderDetails/:orderId";
  static const String kPastOrdersView = "/pastOrders";
  static const String kDriverUnAuth = "/driverUnauth";
  static String getLaundryOrderRoute(int orderId) {
    return kLaundryOrderView.replaceFirst(":orderId", orderId.toString());
  }

  static String getRestaurantOrderRoute(int orderId) {
    return kRestaurantOrderView.replaceFirst(":orderId", orderId.toString());
  }

  static String getOrderDetailsRoute(int orderId) {
    return kOrderDetailsView.replaceFirst(":orderId", "$orderId");
  }

  static List<GetPage> routes = [
        GetPage(
            name: kCurrentOrdersListRoute,
            page: () => CurrentOrdersListScreen()),
        GetPage(name: SharedRoutes.kHomeRoute, page: () => DeliveryWrapper()),
        //  GetPage(name: kLaundryOrderView, page: () => LaundryOrderView()),
        GetPage(name: kRestaurantOrderView, page: () => DvOrderView()),
        GetPage(name: kOrderDetailsView, page: () => OrderDetailsScreen()),
        GetPage(name: kPastOrdersView, page: () => DriverPastOrdersView()),
        GetPage(name: kDriverUnAuth, page: () => UnAuthorizedDriverView()),
      ] +
      SharedRoutes.routes +
      NativeOnlyRoutes.routes;
}

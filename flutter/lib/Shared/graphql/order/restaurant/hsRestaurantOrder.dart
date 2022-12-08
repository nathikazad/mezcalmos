import 'package:graphql/client.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/order/restaurant/__generated/restaurant_order.graphql.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryMode.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();

Stream<RestaurantOrder?> listen_on_restaurant_order({required int order_id}) {
  return _hasuraDb.graphQLClient
      .subscribe$get_user_orders(
    Options$Subscription$get_user_orders(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$get_user_orders(
        order_id: order_id,
      ),
    ),
  )
      .map<RestaurantOrder?>((event) {
    num _itemsCost = 0;
    final List<RestaurantOrderItem> items = [];

    final Subscription$get_user_orders$restaurant_order_by_pk? _o =
        event.parsedData?.restaurant_order_by_pk;
    if (_o != null) {
      _o.items.forEach((item) {
        _itemsCost += (item.cost_per_one * item.quantity);
      });
      final RestaurantOrder res = RestaurantOrder(
        deliveryMode: DeliveryMode.None,
        orderId: _o.id,
        chatId: _o.chat_id,
        status: _o.status.toRestaurantOrderStatus(),
        quantity: 1,
        serviceProviderId: _o.restaurant.id,
        paymentType: _o.payment_type.toPaymentType(),
        orderTime: DateTime.parse(_o.order_time),
        cost: _o.delivery_cost,
        restaurant: ServiceInfo(
          location: Location(
            _o.restaurant.location_text,
            _o.restaurant.location_gps.toLocationData(),
          ),
          firebaseId: _o.restaurant.firebase_id!,
          hasuraId: _o.restaurant.id,
          image: _o.restaurant.image,
          name: _o.restaurant.name,
        ),
        customer: Get.find<AuthController>().user!,
        to: Location(
            _o.to_location_address!, _o.to_location_gps!.toLocationData()),
        itemsCost: _itemsCost,
        shippingCost: _o.delivery_cost,
      );

      res.items = items;
      return res;
    }
  });
}

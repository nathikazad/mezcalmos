import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/order/delivery_order/__generated/delivery_order.graphql.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryMode.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();

Stream<List<RestaurantOrder>?> listen_on_delivery_orders(
    {required int orderId}) {
  return _hasuraDb.graphQLClient
      .subscribe$get_orders(
    Options$Subscription$get_orders(fetchPolicy: FetchPolicy.noCache),
  )
      .map<List<RestaurantOrder>>((QueryResult<Subscription$get_orders> event) {
    List<RestaurantOrder> _o = [];

    final List<Subscription$get_orders$delivery_order?>? ordersData =
        event.parsedData?.delivery_order;
    if (ordersData != null) {
      ordersData.forEach((orderData) {
        _o.add(RestaurantOrder(
          chatId: orderData!.chat_with_customer_id,
          orderId: orderData.id,
          notes: "",
          status: orderData.status.toRestaurantOrderStatus(),
          quantity: 1,
          serviceProviderId: orderData.restaurant!.id,
          paymentType: orderData.payment_type.toPaymentType(),
          orderTime: DateTime.parse(orderData.order_time),
          cost: orderData.delivery_cost,
          restaurant: ServiceInfo(
            location: Location(
              orderData.restaurant!.location_text,
              orderData.restaurant!.location_gps.toLocationData(),
            ),
            firebaseId: orderData.restaurant!.firebase_id,
            hasuraId: orderData.restaurant!.id,
            image: orderData.restaurant!.image,
            name: orderData.restaurant!.name,
          ),
          customer: UserInfo(
              hasuraId: orderData.customer.user.id,
              image: orderData.customer.user.image,
              name: orderData.customer.user.name),
          to: Location("", orderData.current_gps!.toLocationData()),
          itemsCost: orderData.delivery_cost ?? 0,
          shippingCost: orderData.delivery_cost,
          deliveryMode: DeliveryMode.ForwardedToMezCalmos,
        )
            // RestaurantOrder(
            //   customerDropOffDriverChatId: order!.chat_with_customer_id,
            //   // serviceProviderDropOffDriverChatId:
            //   //     order.chat_with_service_provider_id,
            //   orderId: order.id,
            //   chatId: order.id,
            //   paymentType: order.payment_type.toPaymentType(),
            //   orderTime: DateTime.parse(order.order_time),
            //   cost: order.delivery_cost,
            //   customer: UserInfo(
            //     hasuraId: order.customer.user.id,
            //     image: order.customer.user.image,
            //     name: order.customer.user.name,
            //   ),
            //   to: order.current_gps.toLocationData(),
            //   orderType: OrderType.Restaurant,
            // ),
            );
      });
      // final RestaurantOrder res = RestaurantOrder(
      //   chatId: orderData.chat_id,
      //   orderId: orderData.id,
      //   notes: orderData.notes,
      //   status: orderData.status.toRestaurantOrderStatus(),
      //   quantity: 1,
      //   serviceProviderId: orderData.restaurant.id,
      //   paymentType: orderData.payment_type.toPaymentType(),
      //   orderTime: DateTime.parse(orderData.order_time),
      //   cost: orderData.delivery_cost,
      //   restaurant: ServiceInfo(
      //     location: Location(
      //       orderData.restaurant.location_text,
      //       orderData.restaurant.location_gps.toLocationData(),
      //     ),
      //     firebaseId: orderData.restaurant.firebase_id,
      //     hasuraId: orderData.restaurant.id,
      //     image: orderData.restaurant.image,
      //     name: orderData.restaurant.name,
      //   ),
      //   customer: UserInfo(
      //       hasuraId: orderData.customer.user.id,
      //       image: orderData.customer.user.image,
      //       name: orderData.customer.user.name),
      //   to: Location(orderData.to_location_address!,
      //       orderData.to_location_gps!.toLocationData()),
      //   itemsCost: orderData.items_cost ?? 0,
      //   shippingCost: orderData.delivery_cost,
      //   deliveryMode: DeliveryMode.ForwardedToMezCalmos,
      // );

      // res.items = items;
      return _o;
    } else {
      throw Exception(
          "🚨🚨🚨🚨 listen_on_restaurant_order_by_id exception ${event.exception}");
    }
  });
}

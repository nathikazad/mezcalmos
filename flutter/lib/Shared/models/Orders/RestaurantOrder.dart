import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/User.dart';

//ignore_for_file:constant_identifier_names
enum RestaurantOrderStatus {
  OrderReceieved,
  PreparingOrder,
  ReadyForPickup,
  OnTheWay,
  Delivered,
  CancelledByAdmin,
  CancelledByCustomer
}

extension ParseRestaurantOrderStatusToString on RestaurantOrderStatus {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToRestaurantOrderStatus on String {
  RestaurantOrderStatus toRestaurantOrderStatus() {
    return RestaurantOrderStatus.values.firstWhere(
        (RestaurantOrderStatus e) => e.toFirebaseFormatString() == this);
  }
}

class RestaurantOrder extends DeliverableOrder {
  int quantity;
  num itemsCost;
  num shippingCost;
  List<RestaurantOrderItem> items = <RestaurantOrderItem>[];
  String? notes;
  RestaurantOrderStatus status;
  ServiceInfo get restaurant => serviceProvider! as ServiceInfo;
  DateTime? estimatedFoodReadyTime;
  RestaurantOrder({
    required String orderId,
    required this.status,
    required this.quantity,
    required String serviceProviderId,
    required PaymentType paymentType,
    required DateTime orderTime,
    required num cost,
    required ServiceInfo restaurant,
    required UserInfo customer,
    required Location to,
    this.estimatedFoodReadyTime,
    DeliveryDriverUserInfo? dropoffDriver,
    String? dropOffDriverChatId,
    required this.itemsCost,
    required this.shippingCost,
    String? customerDropOffDriverChatId,
    DateTime? estimatedPickupFromServiceProviderTime,
    DateTime? estimatedDropoffAtCustomerTime,
    this.notes,
    RouteInformation? routeInformation,
  }) : super(
          orderId: orderId,
          orderType: OrderType.Restaurant,
          serviceProviderId: serviceProviderId,
          paymentType: paymentType,
          orderTime: orderTime,
          cost: cost,
          customer: customer,
          serviceProvider: restaurant,
          to: to,
          dropoffDriver: dropoffDriver,
          serviceProviderDropOffDriverChatId: dropOffDriverChatId,
          customerDropOffDriverChatId: customerDropOffDriverChatId,
          routeInformation: routeInformation,
          estimatedPickupFromServiceProviderTime:
              estimatedPickupFromServiceProviderTime,
          estimatedDropoffAtCustomerTime: estimatedDropoffAtCustomerTime,
        );

  //ignore_for_file:avoid_annotating_with_dynamic
  factory RestaurantOrder.fromData(dynamic id, dynamic data) {
    final RestaurantOrder restaurantOrder = RestaurantOrder(
      orderId: id,
      status: data["status"].toString().toRestaurantOrderStatus(),
      quantity: data["quantity"],
      serviceProviderId: data["serviceProviderId"],
      paymentType: data["paymentType"].toString().toPaymentType(),
      orderTime: DateTime.parse(data["orderTime"]),
      estimatedFoodReadyTime: (data["estimatedFoodReadyTime"] != null)
          ? DateTime.parse(data["estimatedFoodReadyTime"])
          : null,
      estimatedPickupFromServiceProviderTime: (data["estimatedDeliveryTimes"]
                  ?["dropoff"]?["pickup"] !=
              null)
          ? DateTime.parse(data["estimatedDeliveryTimes"]["dropoff"]["pickup"])
          : null,
      estimatedDropoffAtCustomerTime: (data["estimatedDeliveryTimes"]
                  ?["dropoff"]?["dropoff"] !=
              null)
          ? DateTime.parse(data["estimatedDeliveryTimes"]["dropoff"]["dropoff"])
          : null,
      cost: data["cost"],
      notes: data["notes"],
      to: Location.fromFirebaseData(data['to']),
      restaurant: ServiceInfo.fromData(data["restaurant"]),
      customer: UserInfo.fromData(data["customer"]),
      itemsCost: data['itemsCost'],
      shippingCost: data['shippingCost'] ?? 0,
      dropoffDriver: (data["dropoffDriver"] != null)
          ? DeliveryDriverUserInfo.fromData(data["dropoffDriver"])
          : null,
      dropOffDriverChatId: data['secondaryChats']
          ?['serviceProviderDropOffDriver'],
      customerDropOffDriverChatId: data['secondaryChats']
          ?['customerDropOffDriver'],
    );

    if (data["routeInformation"] != null) {
      mezDbgPrint("routeInformation not nulllll !!!!!!!!!!");
      restaurantOrder.routeInformation = RouteInformation(
        polyline: data["routeInformation"]["polyline"],
        distance: RideDistance.fromJson(data["routeInformation"]["distance"]),
        duration: RideDuration.fromJson(
          data["routeInformation"]["duration"],
        ),
      );
    }

    data["items"].forEach((dynamic itemId, dynamic itemData) {
      final RestaurantOrderItem restaurantOrderItem = RestaurantOrderItem(
          costPerOne: itemData["costPerOne"],
          totalCost: itemData["totalCost"],
          idInCart: itemId,
          idInRestaurant: itemData["id"],
          name: convertToLanguageMap(itemData["name"]),
          image: itemData["image"],
          quantity: itemData["quantity"],
          notes: itemData["notes"]);

      itemData["chosenChoices"]?.forEach((optionId, optionData) {
        restaurantOrderItem.chosenChoices[optionId] = <Choice>[];
        restaurantOrderItem.optionNames[optionId] =
            convertToLanguageMap(optionData["optionName"]);

        optionData["choices"]?.forEach((choiceData) {
          restaurantOrderItem.chosenChoices[optionId]!
              .add(Choice.fromData(choiceData["id"], choiceData));
        });
      });
      restaurantOrder.items.add(restaurantOrderItem);
    });
    return restaurantOrder;
  }

  String get restaurantId => serviceProviderId!;

  @override
  String toString() {
    return "{quantity : $quantity , itemCost: $itemsCost , items : ${items.length} , notes : $notes , status : $status}";
  }

  @override
  bool isCanceled() {
    return status == RestaurantOrderStatus.CancelledByCustomer ||
        status == RestaurantOrderStatus.CancelledByAdmin;
  }

  @override
  bool inProcess() {
    return status == RestaurantOrderStatus.OrderReceieved ||
        status == RestaurantOrderStatus.PreparingOrder ||
        status == RestaurantOrderStatus.ReadyForPickup ||
        status == RestaurantOrderStatus.OnTheWay;
  }

  bool inDeliveryPhase() {
    return status == RestaurantOrderStatus.ReadyForPickup ||
        status == RestaurantOrderStatus.OnTheWay;
  }

  String clipBoardText(LanguageType languageType) {
    String text = "";
    text += "${restaurant.name}\n";
    text +=
        items.fold<String>("", (String mainString, RestaurantOrderItem item) {
      mainString +=
          "  ${item.name[languageType]} x${item.quantity} ${item.totalCost}\n";

      item.optionNames.forEach((String optionId, LanguageMap languageMap) {
        if (item.chosenChoices.containsKey(optionId)) {
          mainString += "    ${languageMap[languageType]}\n";
          mainString += item.chosenChoices[optionId]!.fold("",
              (String thirdString, Choice choice) {
            return "$thirdString      ${choice.name[languageType]}\n";
          });
        }
      });
      if (item.notes != null && item.notes!.length > 0)
        mainString += "    ${item.notes}\n";
      return mainString;
    });
    text += "$notes\n";
    text += "$cost\n";
    text += "${customer.name}\n";
    text += "${to.address}\n";
    text +=
        "https://www.google.com/maps/dir/?api=1&destination=${to.latitude},${to.longitude}";

    return text;
  }
}

class RestaurantOrderItem {
  num costPerOne;
  num totalCost;
  String idInCart;
  String idInRestaurant;
  LanguageMap name;
  String? image;
  int quantity;
  String? notes;
  //optionId and list of choices for that option
  Map<String, List<Choice>> chosenChoices = <String, List<Choice>>{};
  //optionId and list of choices for that option
  Map<String, LanguageMap> optionNames = <String, LanguageMap>{};
  RestaurantOrderItem(
      {required this.costPerOne,
      required this.totalCost,
      required this.idInCart,
      required this.idInRestaurant,
      required this.name,
      required this.image,
      required this.quantity,
      this.notes});
}

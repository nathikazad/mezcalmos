import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryMode.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart';
import 'package:mezcalmos/Shared/models/Utilities/SelfDeliveryDetails.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

//ignore_for_file:constant_identifier_names
enum RestaurantOrderStatus {
  OrderReceived,
  Preparing,
  Ready,
  OnTheWay,
  Delivered,
  CancelledByAdmin,
  CancelledByCustomer,
}

extension ParseRestaurantOrderStatusToString on RestaurantOrderStatus {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToRestaurantOrderStatus on String {
  RestaurantOrderStatus toRestaurantOrderStatus() {
    mezDbgPrint(this);
    return RestaurantOrderStatus.values.firstWhere(
      (RestaurantOrderStatus e) {
        return e.toFirebaseFormatString() == this;
      },
    );
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
  DateTime? deliveryTime;
  DateTime? scheduledTime;
  Review? review;
  DeliveryMode deliveryMode;
  SelfDeliveryDetails? selfDeliveryDetails;
  int? deliveryOrderId;

  RestaurantOrder(
      {required super.orderId,
      super.orderType = OrderType.Restaurant,
      required this.status,
      required this.quantity,
      required super.serviceProviderId,
      required super.paymentType,
      required super.orderTime,
      required super.cost,
      required ServiceInfo restaurant,
      required super.customer,
      required super.to,
      this.estimatedFoodReadyTime,
      super.dropoffDriver,
      this.deliveryTime,
      this.scheduledTime,
      this.deliveryOrderId,
      this.review,
      int? dropOffDriverChatId,
      required this.itemsCost,
      required this.shippingCost,
      required super.deliveryProviderType,
      super.customerDropOffDriverChatId,
      super.estimatedPickupFromServiceProviderTime,
      super.estimatedDropoffAtCustomerTime,
      this.notes,
      super.routeInformation,
      super.notifiedAdmin,
      super.notifiedOperator,
      super.totalCostBeforeShipping,
      super.totalCost,
      super.refundAmount,
      super.costToCustomer,
      super.dropOffShippingCost,
      required super.chatId,
      required this.deliveryMode,
      this.selfDeliveryDetails})
      : super(
            serviceProvider: restaurant,
            serviceProviderDropOffDriverChatId: dropOffDriverChatId);

  //ignore_for_file:avoid_annotating_with_dynamic
  factory RestaurantOrder.fromData(
    dynamic id,
    dynamic data,
  ) {
    if (data?["to"]?["lat"] == null) {
      mezDbgPrint("to nul =================>>>>>>>>>>>>>>$data");
      mezDbgPrint("to nul =================>>>>>>>>>>>>>>$id");
    }
    final RestaurantOrder restaurantOrder = RestaurantOrder(
        orderId: id,
        deliveryProviderType: ServiceProviderType.Restaurant,
        chatId: 1,
        status: data["status"].toString().toRestaurantOrderStatus(),
        quantity: data["quantity"],
        serviceProviderId: data["serviceProviderId"],
        paymentType: data["paymentType"].toString().convertToPaymentType(),
        orderTime: DateTime.parse(data["orderTime"]),
        deliveryMode: data?["deliveryMode"]?.toString().toDeliveryMode() ??
            DeliveryMode.None,
        estimatedFoodReadyTime: (data["estimatedFoodReadyTime"] != null)
            ? DateTime.parse(data["estimatedFoodReadyTime"])
            : null,
        estimatedPickupFromServiceProviderTime:
            (data["estimatedDeliveryTimes"]?["dropoff"]?["pickup"] != null)
                ? DateTime.parse(
                    data["estimatedDeliveryTimes"]["dropoff"]["pickup"])
                : null,
        estimatedDropoffAtCustomerTime:
            (data["estimatedDeliveryTimes"]?["dropoff"]?["dropoff"] != null)
                ? DateTime.parse(
                    data["estimatedDeliveryTimes"]["dropoff"]["dropoff"])
                : null,
        cost: data["cost"],
        notes: data["notes"],
        deliveryTime: (data["deliveryTime"] != null)
            ? DateTime.tryParse(data["deliveryTime"])
            : null,
        to: data['to'] == null
            ? MezLocation.fromFirebaseData(
                {
                  "address": "---------",
                  "lat": 15.871937999999997,
                  "lng": -97.091954
                },
              )
            : MezLocation.fromFirebaseData(data['to']),
        restaurant: ServiceInfo.fromData(data["restaurant"]),
        // TODO:544D-HASURA
        customer: UserInfo(
            hasuraId: 1, firebaseId: "firebaseId", name: null, image: null),
        // customer: UserInfo.fromData(data["customer"]),
        itemsCost: data['itemsCost'],
        // selfDelivery: data['selfDelivery'] ?? false,
        shippingCost: data["shippingCost"] ?? 0,
        selfDeliveryDetails: (data["selfDeliveryDetails"] != null)
            ? SelfDeliveryDetails.fromMap(data["selfDeliveryDetails"])
            : null,
        dropoffDriver: (data["dropoffDriver"] != null)
            ? DeliveryDriverUserInfo.fromData(data["dropoffDriver"])
            : null,
        dropOffDriverChatId: data['secondaryChats']
            ?['serviceProviderDropOffDriver'],
        customerDropOffDriverChatId: data['secondaryChats']
            ?['customerDropOffDriver'],
        totalCostBeforeShipping: data['totalCostBeforeShipping'],
        totalCost: data['totalCost'],
        refundAmount: data['refundAmount'],
        costToCustomer: data['costToCustomer'],
        notifiedAdmin: data['notified']?['admin'] ?? false,
        notifiedOperator: data['notified']?['operator'] ?? false);
    // if (data["review"] != null) {
    //   restaurantOrder.review = Review.fromMap(null, data["review"]);
    //   // data["reviews"]?.forEach((key, review) {
    //   //   mezDbgPrint("ADD REVIEW ON ORDER===============");
    //   //   restaurantOrder.reviews.add(Review.fromMap(key, review));
    //   // });
    // }
    if (data["routeInformation"] != null) {
      restaurantOrder.routeInformation = RouteInformation(
        polyline: data["routeInformation"]["polyline"],
        distance: RideDistance.fromJson(data["routeInformation"]["distance"]),
        duration: RideDuration.fromJson(
          data["routeInformation"]["duration"],
        ),
      );
    }

    if (data["stripePaymentInfo"] != null) {
      restaurantOrder.stripePaymentInfo =
          StripeOrderPaymentInfo.fromJson(data["stripePaymentInfo"]);
    }

    data["items"]?.forEach((dynamic itemId, dynamic itemData) {
      final RestaurantOrderItem restaurantOrderItem =
          RestaurantOrderItem.fromData(itemId, itemData);
      restaurantOrder.items.add(restaurantOrderItem);
    });
    return restaurantOrder;
  }

  int get restaurantId => serviceProviderId!;

  @override
  String toString() {
    return "{quantity : $quantity , itemCost: $itemsCost , items : ${items.length} , notes : $notes , status : $status}";
  }

  @override
  bool isCanceled() {
    return status == RestaurantOrderStatus.CancelledByCustomer ||
        status == RestaurantOrderStatus.CancelledByAdmin;
  }

  bool isScheduled() {
    return deliveryTime != null &&
        deliveryTime!.toLocal().isAfter(DateTime.now().toLocal());
  }

  //   String getRightChatId() {
  //   if (getCurrentPhase() == LaundryOrderPhase.Pickup &&
  //       customerPickupDriverChatId != null) {
  //     return customerPickupDriverChatId;
  //   } else if (customerDropOffDriverChatId != null) {
  //     return customerDropOffDriverChatId;
  //   }
  //   return null;
  // }
  bool get isFinished {
    return isCanceled() || status == RestaurantOrderStatus.Delivered;
  }

  @override
  bool inProcess() {
    return status == RestaurantOrderStatus.OrderReceived ||
        status == RestaurantOrderStatus.Preparing ||
        status == RestaurantOrderStatus.Ready ||
        status == RestaurantOrderStatus.OnTheWay;
  }

  bool isSelfDelivery() {
    return deliveryProviderType == ServiceProviderType.Restaurant;
  }

  bool inDeliveryPhase() {
    return status == RestaurantOrderStatus.OnTheWay;
  }

  // bool inSelfDelivery() {
  //   return (status == RestaurantOrderStatus.Ready ||
  //           status == RestaurantOrderStatus.OnTheWay) &&
  //       (deliveryMode == DeliveryMode.SelfDeliveryByDriver ||
  //           deliveryMode == DeliveryMode.SelfDeliveryByRestaurant);
  // }

  bool get selfDelivery {
    return deliveryMode == DeliveryMode.SelfDeliveryByDriver ||
        deliveryMode == DeliveryMode.SelfDeliveryByRestaurant;
  }

  bool get showItemsImages {
    return items.firstWhereOrNull(
            (RestaurantOrderItem element) => element.image != null) !=
        null;
  }

  DateTime? get estDropOffTime {
    if (deliveryMode == DeliveryMode.SelfDeliveryByRestaurant) {
      return selfDeliveryDetails?.estDeliveryTime;
    }
    return estimatedDropoffAtCustomerTime;
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
  int idInCart;
  int idInRestaurant;
  LanguageMap name;
  String? image;
  int quantity;
  String? notes;
  bool unavailable;
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
      this.notes,
      this.unavailable = false});

  factory RestaurantOrderItem.fromData(dynamic itemId, dynamic itemData) {
    final RestaurantOrderItem restaurantOrderItem = RestaurantOrderItem(
        costPerOne: itemData["costPerOne"],
        totalCost: itemData["totalCost"],
        idInCart: itemId,
        idInRestaurant: itemData["id"],
        name: convertToLanguageMap(itemData["name"]),
        image: itemData["image"],
        quantity: itemData["quantity"],
        notes: itemData["notes"],
        unavailable: itemData["unavailable"] ?? false);

    itemData?["chosenChoices"]?.forEach((optionId, optionData) {
      restaurantOrderItem.chosenChoices[optionId] = <Choice>[];
      restaurantOrderItem.optionNames[optionId] =
          convertToLanguageMap(optionData["optionName"]);

      optionData?["choices"]?.forEach((choiceData) {
        restaurantOrderItem.chosenChoices[optionId]!
            .add(Choice.fromData(choiceData["id"], choiceData));
      });
    });
    return restaurantOrderItem;
  }
}

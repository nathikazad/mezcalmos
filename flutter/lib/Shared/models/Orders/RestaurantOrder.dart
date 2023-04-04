import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/SelfDeliveryDetails.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

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
    return RestaurantOrderStatus.values.firstWhere(
      (RestaurantOrderStatus e) {
        return e.toFirebaseFormatString() == this;
      },
    );
  }
}

class RestaurantOrder extends DeliverableOrder {
  List<RestaurantOrderItem> items = <RestaurantOrderItem>[];
  String? notes;
  RestaurantOrderStatus status;
  ServiceInfo get restaurant => serviceProvider as ServiceInfo;

  SelfDeliveryDetails? selfDeliveryDetails;

  RestaurantOrder(
      {required super.orderId,
      super.orderType = OrderType.Restaurant,
      required this.status,
      required super.serviceProviderId,
      required super.paymentType,
      required super.orderTime,
      required super.costs,
      required super.serviceProvider,
      required super.scheduleTime,
      required super.customer,
      required super.dropOffLocation,
      super.estimatedPackageReadyTime,
      super.driverInfo,
      super.review,
      required super.deliveryProviderType,
      super.estimatedArrivalAtPickup,
      super.estimatedArrivalAtDropoff,
      this.notes,
      super.routeInformation,
      super.notifiedAdmin,
      super.notifiedOperator,
      required super.chatId,
      this.selfDeliveryDetails,
      required super.deliveryDirection,
      required super.deliveryCompany,
      required super.driverLocation,
      required super.serviceProviderDriverChatId,
      required super.customerDriverChatId,
      required super.deliveryOrderId,
      required super.pickupLocation});

  int get restaurantId => serviceProviderId!;

  @override
  bool isCanceled() {
    return status == RestaurantOrderStatus.CancelledByCustomer ||
        status == RestaurantOrderStatus.CancelledByAdmin;
  }

  bool get isFinished {
    return isCanceled() || status == RestaurantOrderStatus.Delivered;
  }

  bool get canAddReview {
    return review == null && status == RestaurantOrderStatus.Delivered;
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

  bool get showItemsImages {
    return items.firstWhereOrNull(
            (RestaurantOrderItem element) => element.image != null) !=
        null;
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

    text += "${customer.name}\n";
    text += "${dropOffLocation.address}\n";
    text += "https:";

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

  Map<String, List<Choice>> chosenChoices = <String, List<Choice>>{};

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

  factory RestaurantOrderItem.fromData(itemId, itemData) {
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

import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class RestaurantOrder extends Order {
  RestaurantOrderStatus status;
  int quantity;
  List<RestaurantOrderItem> items = [];
  String? notes;
  UserInfo get restaurant => this.serviceProvider!;
  RestaurantOrder(
      {required String orderId,
      required this.status,
      required this.quantity,
      required String serviceProviderId,
      required PaymentType paymentType,
      required DateTime orderTime,
      required num cost,
      required UserInfo restaurant,
      required UserInfo customer,
      required Location to,
      this.notes})
      : super(
            orderId: orderId,
            orderType: OrderType.Restaurant,
            serviceProviderId: serviceProviderId,
            paymentType: paymentType,
            orderTime: orderTime,
            cost: cost,
            customer: customer,
            serviceProvider: restaurant,
            to: to);
  factory RestaurantOrder.fromData(dynamic id, dynamic data) {
    RestaurantOrder restaurantOrder = RestaurantOrder(
        orderId: id,
        status: data["status"].toString().toRestaurantOrderStatus(),
        quantity: data["quantity"],
        serviceProviderId: data["serviceProviderId"],
        paymentType: data["paymentType"].toString().toPaymentType(),
        orderTime: DateTime.parse(data["orderTime"]),
        cost: data["cost"],
        notes: data["notes"],
        to: Location.fromFirebaseData(data['to']),
        restaurant: UserInfo.fromData(data["restaurant"]),
        customer: UserInfo.fromData(data["customer"]));

    data["items"].forEach((dynamic itemId, dynamic itemData) {
      // mezDbgPrint(itemData.toString());

      RestaurantOrderItem restaurantOrderItem = RestaurantOrderItem(
          costPerOne: itemData["costPerOne"],
          totalCost: itemData["totalCost"],
          idInCart: itemId,
          idInRestaurant: itemData["id"],
          name: itemData["name"],
          image: itemData["image"],
          quantity: itemData["quantity"],
          notes: itemData["notes"]);
      itemData["options"]?["chosenManyOptions"]
          ?.forEach((dynamic id, dynamic data) {
        restaurantOrderItem.chooseManyOptions.add(ChooseManyOption(
            optionId: id,
            optionName: data["name"],
            chosenValueCost: data["chosenValueCost"],
            chosenOptionValue: data["chosenValue"]));
      });
      itemData["options"]?["chosenOneOptions"]
          ?.forEach((dynamic id, dynamic data) {
        restaurantOrderItem.chooseOneOptions.add(ChooseOneOption(
            optionId: id,
            optionName: data["name"],
            chosenOptionId: data["chosenOptionId"],
            chosenOptionCost: data["chosenOptionCost"],
            chosenOptionName: data["chosenOptionName"]));
      });
      restaurantOrder.items.add(restaurantOrderItem);
    });
    return restaurantOrder;
  }

  String get restaurantId => this.serviceProviderId!;

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

  String get clipBoardText {
    String text = "";
    text += "${this.restaurant.name}\n";
    text += this.items.fold<String>("", (mainString, item) {
      mainString += "  ${item.name} x${item.quantity} ${item.totalCost}\n";
      mainString +=
          item.chooseOneOptions.fold("", (secondString, chooseOneOption) {
        return "${secondString}    ${chooseOneOption.optionName}: ${chooseOneOption.chosenOptionName}\n";
      });
      mainString +=
          item.chooseManyOptions.fold("", (secondString, chooseManyOption) {
        mezDbgPrint(chooseManyOption.optionName);
        return "${secondString}    ${chooseManyOption.optionName}\n";
      });
      mainString += "    ${item.notes}\n";
      return mainString;
    });
    text += "${this.notes}\n";
    text += "${this.cost}\n";
    text += "${this.customer.name}\n";
    text += "${this.to.address}\n";
    text +=
        "https://www.google.com/maps/@${this.to.latitude},${this.to.longitude},15z";
    mezDbgPrint(text);
    return text;
  }
}

class RestaurantOrderItem {
  num costPerOne;
  num totalCost;
  String idInCart;
  String idInRestaurant;
  String name;
  String image;
  int quantity;
  String? notes;
  List<ChooseManyOption> chooseManyOptions = [];
  List<ChooseOneOption> chooseOneOptions = [];
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

class ChooseOneOption {
  String optionId;
  String optionName;
  String chosenOptionId;
  String chosenOptionName;
  num chosenOptionCost;
  ChooseOneOption(
      {required this.optionId,
      required this.optionName,
      required this.chosenOptionId,
      required this.chosenOptionCost,
      required this.chosenOptionName});
}

class ChooseManyOption {
  String optionId;
  String optionName;
  bool chosenOptionValue;
  num chosenValueCost;
  ChooseManyOption(
      {required this.optionId,
      required this.optionName,
      required this.chosenValueCost,
      required this.chosenOptionValue});
}

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
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToRestaurantOrderStatus on String {
  RestaurantOrderStatus toRestaurantOrderStatus() {
    return RestaurantOrderStatus.values
        .firstWhere((e) => e.toFirebaseFormatString() == this);
  }
}

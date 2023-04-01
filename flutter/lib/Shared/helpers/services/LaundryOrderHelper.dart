import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:rive/rive.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['CustomerApp']['pages']['Laundry']
        ['LaundryCurrentOrderView']['Components']['LaundryOrderStatusCard'];

Widget atLaundryIcon = Container(
  height: 50,
  width: 50,
  child: RiveAnimation.asset(
    "assets/animation/washingMachine.riv",
    fit: BoxFit.cover,
  ),
);

extension LaundryOrderWidgets on LaundryOrderStatus {
// getting the order status string

  String get titleForCustomer {
    switch (this) {
      case LaundryOrderStatus.CancelledByAdmin:
      case LaundryOrderStatus.CancelledByCustomer:
        return _i18n()['canceled'];

      case LaundryOrderStatus.OrderReceived:
        return _i18n()['orderReceived'];
      case LaundryOrderStatus.OtwPickupFromCustomer:
        return _i18n()['otwPickUp'];
      case LaundryOrderStatus.PickedUpFromCustomer:
        return _i18n()['pickedUp'];
      case LaundryOrderStatus.AtLaundry:
        return _i18n()['atLaundry'];
      case LaundryOrderStatus.ReadyForDelivery:
        return _i18n()['readyForDelivery'];
      case LaundryOrderStatus.OtwPickupFromLaundry:
      case LaundryOrderStatus.PickedUpFromLaundry:
        return _i18n()['otwDelivery'];
      case LaundryOrderStatus.Delivered:
        return _i18n()['delivered'];
      default:
        return '';
    }
  }

  String get title {
    switch (this) {
      case LaundryOrderStatus.CancelledByAdmin:
      case LaundryOrderStatus.CancelledByCustomer:
        return _i18n()['canceled'];

      case LaundryOrderStatus.OrderReceived:
        return _i18n()['orderReceived'];
      case LaundryOrderStatus.OtwPickupFromCustomer:
        return _i18n()['otwToCustomer'];
      case LaundryOrderStatus.PickedUpFromCustomer:
        return _i18n()['pickedUpFromCustomer'];
      case LaundryOrderStatus.AtLaundry:
        return _i18n()['atLaundry'];
      case LaundryOrderStatus.ReadyForDelivery:
        return _i18n()['readyForDelivery'];
      case LaundryOrderStatus.OtwPickupFromLaundry:
        return _i18n()['otwToLaundry'];
      case LaundryOrderStatus.PickedUpFromLaundry:
        return _i18n()['pickedUpFromLaundry'];

      case LaundryOrderStatus.Delivered:
        return _i18n()['delivered'];
      default:
        return '';
    }
  }

  // getting icons widgets reperesent the current status
  Widget get widget {
    switch (this) {
      case LaundryOrderStatus.AtLaundry:
        return FutureBuilder<Widget?>(
            future: _geAtLaundrytWidget(),
            builder: (BuildContext context, AsyncSnapshot<Widget?> snapshot) {
              return Container(
                child: snapshot.data,
              );
            });

      case LaundryOrderStatus.OtwPickupFromCustomer:
      case LaundryOrderStatus.OtwPickupFromLaundry:
      case LaundryOrderStatus.PickedUpFromLaundry:
      case LaundryOrderStatus.PickedUpFromCustomer:
        return FutureBuilder<Widget?>(
            future: _getScooterWidget(),
            builder: (BuildContext context, AsyncSnapshot<Widget?> snapshot) {
              return Container(
                child: snapshot.data,
              );
            });
      default:
        return _getStaticOrderWidget();
    }
  }

  Future<Widget?> _geAtLaundrytWidget() async {
    final Rx<Widget> icon = Rx<Widget>(Container());
    final Rx<RiveAnimation> animation = Rx<RiveAnimation>(aDriverAnimation);

    await Future.delayed(Duration.zero);

    animation.value = aWashingAnimation;
    icon.value = animation.value;

    return Container(height: 50, width: 50, child: icon.value);
  }

  Future<Widget?> _getScooterWidget() async {
    final Rx<Widget> icon = Rx<Widget>(Container());
    final Rx<RiveAnimation> animation = Rx<RiveAnimation>(aWashingAnimation);

    await Future.delayed(Duration.zero);

    animation.value = aDriverAnimation;
    icon.value = animation.value;

    return Container(height: 50, width: 50, child: icon.value);
  }

  Widget _getStaticOrderWidget() {
    Widget orderWidget = Container();

    switch (this) {
      case LaundryOrderStatus.CancelledByCustomer:
      case LaundryOrderStatus.CancelledByAdmin:
        orderWidget = Container(
          padding: const EdgeInsets.all(5),
          decoration:
              BoxDecoration(color: Color(0xFFF9D8D6), shape: BoxShape.circle),
          child: Icon(
            Icons.close,
            size: 25,
            color: Colors.red,
          ),
        );
        break;
      case LaundryOrderStatus.AtLaundry:
        orderWidget = Container(
          height: 50,
          width: 50,
          child: RiveAnimation.asset(
            "assets/animation/washingMachine.riv",
            fit: BoxFit.cover,
          ),
        );

        break;
      case LaundryOrderStatus.OrderReceived:
        orderWidget = Container(
          child: Icon(
            Icons.local_laundry_service,
            size: 40,
            color: primaryBlueColor,
          ),
        );
        break;
      case LaundryOrderStatus.OtwPickupFromCustomer:
      case LaundryOrderStatus.OtwPickupFromLaundry:
      case LaundryOrderStatus.PickedUpFromLaundry:
      case LaundryOrderStatus.PickedUpFromCustomer:
        orderWidget = Container(
          height: 50,
          width: 50,
          child: RiveAnimation.asset(
            "assets/animation/scooterWashingMachine.riv",
            fit: BoxFit.cover,
          ),
        );

        break;

      case LaundryOrderStatus.Delivered:
        orderWidget = Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: secondaryLightBlueColor, shape: BoxShape.circle),
          child: Icon(
            Icons.check,
            size: 25,
            color: primaryBlueColor,
          ),
        );

        break;

      case LaundryOrderStatus.ReadyForDelivery:
        orderWidget = Container(
          child: Icon(
            Icons.dry_cleaning_rounded,
            size: 40,
            color: primaryBlueColor,
          ),
        );
    }
    return orderWidget;

    // return null;
  }
}

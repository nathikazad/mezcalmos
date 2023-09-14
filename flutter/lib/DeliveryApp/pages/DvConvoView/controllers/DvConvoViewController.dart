import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/controllers/DriverCurrentOrdersController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/hsDeliveryMessage/hsDeliveryMessage.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class DvConvoViewController {
  // instances
  HasuraDb _hasuraDb = Get.find<HasuraDb>();
  DeliveryAuthController _authController = Get.find<DeliveryAuthController>();

  // vars
  late String phoneNumber;
  bool get showAcceptBtn =>
      dvMessages.isNotEmpty && dvMessages.last.respondedTime == null;
  RxList<DeliveryMessage> dvMessages = RxList.empty();
  // streams //
  StreamSubscription<List<DeliveryMessage>?>? newMessagesStream;
  String? subscriptionId;

  String? get title {
    if (dvMessages.isNotEmpty) {
      return dvMessages.first.userName ?? dvMessages.first.phoneNumber;
    }
    return null;
  }

  String get driverName => _authController.driver!.driverInfo.name;

  String get driverImage => _authController.driver!.driverInfo.image;

  bool get isFinished =>
      dvMessages.isNotEmpty && dvMessages.last.finishedTime != null;

  bool get isResponded =>
      dvMessages.isNotEmpty && dvMessages.last.respondedTime != null;

  Future<void> init({required String phoneNumber}) async {
    this.phoneNumber = phoneNumber;
    dvMessages.value =
        await getCustomerDvMessages(phoneNumber: phoneNumber, withCache: false);
    subscriptionId = _hasuraDb.createSubscription(start: () {
      newMessagesStream = listenCustomerNewDvMessages(phoneNumber: phoneNumber)
          .listen((List<DeliveryMessage>? event) {
        if (event != null) {
          dvMessages.value = event;
        }
      });
    }, cancel: () {
      newMessagesStream?.cancel();
      newMessagesStream = null;
    });
  }

  Future<void> handleClick() async {
    if (showAcceptBtn) {
      try {
        final MarkMessagesResponse res =
            await CloudFunctions.whatsapp_markMessagesAsResponded(
                phoneNumber: phoneNumber);
        if (res.success) {
          await callWhatsappNumber(phoneNumber);
        } else
          showErrorSnackBar(errorText: res.unhandledError.toString());
      } on Exception catch (e) {
        showErrorSnackBar();
        mezDbgPrint(e);
        // TODO
      }
    } else {
      try {
        final MarkMessagesResponse res =
            await CloudFunctions.whatsapp_markMessagesAsFinished(
                phoneNumbers: [phoneNumber]);
        if (res.success) {
          showSavedSnackBar(title: "Finished", subtitle: "Marked as finished");
        } else
          showErrorSnackBar(errorText: res.unhandledError.toString());
      } on Exception catch (e) {
        showErrorSnackBar();
        mezDbgPrint(e);
        // TODO
      }
    }
  }

  void dispose() {
    if (subscriptionId != null) _hasuraDb.cancelSubscription(subscriptionId!);
  }
}

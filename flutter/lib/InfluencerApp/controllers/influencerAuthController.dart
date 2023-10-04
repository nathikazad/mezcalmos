import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/influencer/hsInfluencer.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class InfluencerAuthController extends GetxController {
  AuthController authController = Get.find<AuthController>();
  Rxn<Influencer> _influencer = Rxn<Influencer>();
  Influencer? get influencer => _influencer.value;
  Future<void> onInit() async {
    super.onInit();
    mezDbgPrint("InfluencerAuthController onInit ");
    await fetchInfluencer();
  }

  Future<void> fetchInfluencer() async {
    if (authController.fireAuthUser?.uid != null) {
      _influencer.value =
          await get_influencer(userId: authController.hasuraUserId!);
      mezDbgPrint(
          "😀 Influencer ===========>${_influencer.value?.toFirebaseFormattedJson()}");
    }
  }

  @override
  Future<void> onClose() async {
    print("[+] InfluencerAuthController::onClose ---------> Was invoked !");

    super.onClose();
  }
}

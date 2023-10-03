import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class InfluencerAuthController extends GetxController {
  AuthController authController = Get.find<AuthController>();
  // Rxn<Influencer> _influencer = Rxn<Influencer>();
  // Influencer? get influencer => _influencer.value;
  Future<void> onInit() async {
    super.onInit();
    mezDbgPrint("InfluencerAuthController onInit ");
    if (authController.fireAuthUser?.uid != null) {
      // Influencer? value =
      //     await get_influencer(user_id: authController.hasuraUserId!);
    }
  }

  @override
  Future<void> onClose() async {
    print("[+] InfluencerAuthController::onClose ---------> Was invoked !");

    super.onClose();
  }
}

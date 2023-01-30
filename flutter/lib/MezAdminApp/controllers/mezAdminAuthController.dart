import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/models/MezAdmin.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/graphql/admin/hsAdmin.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class MezAdminAuthController extends GetxController {
  Rxn<MezAdmin> _admin = Rxn();
  AuthController _authController = Get.find<AuthController>();

  BackgroundNotificationsController _notificationsController =
      Get.find<BackgroundNotificationsController>();

  MezAdmin? get admin => _admin.value;
  Stream<MezAdmin?> get adminStream => _admin.stream;
  // StreamSubscription? _adminNodeListener;

  bool _checkedAppVersion = false;

  @override
  Future<void> onInit() async {
    super.onInit();
    if (_authController.user != null) {
      _admin.value = await get_admin(user_id: _authController.hasuraUserId!);
      mezDbgPrint("_admin.value ====> ${_admin.value}");
    }
  }

  @override
  Future<void> onClose() async {
    mezDbgPrint("[+] AdminAuthController::onClose ---------> Was invoked !");

    super.onClose();
  }
}

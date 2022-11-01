import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/WebApp/main.dart';

class InitialBinding implements Bindings {
  final AppLaunchMode _launchMode;
  InitialBinding(this._launchMode);
  @override
  void dependencies() {
    // TODO: implement dependencies
    // setupFirebase(_launchMode);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class AppLifeCycleController extends GetxController
    with WidgetsBindingObserver {
  final bool logs;
  Map<AppLifecycleState, VoidCallback> callbacks = {
    AppLifecycleState.detached: () => null,
    AppLifecycleState.inactive: () => null,
    AppLifecycleState.paused: () => null,
    AppLifecycleState.resumed: () => null,
  };

  AppLifeCycleController({this.logs = false});

  Rx<AppLifecycleState> _appState = AppLifecycleState.resumed.obs;
  AppLifecycleState get appState => _appState.value;

  void attachCallback(AppLifecycleState onState, VoidCallback f) {
    callbacks[onState] = f;
  }

  void cleanCallback(AppLifecycleState state) {
    callbacks[state] = () => null;
  }

  void cleanAllCallbacks() {
    callbacks.keys.forEach((element) {
      callbacks[element] = () => null;
    });
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void onClose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.onClose();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _appState.value = state;
    callbacks[state]!();
    // if (this.logs)
    //   mezDbgPrint("[+] AppLifeCycleController :: AppStateChanged :: $state");
  }
}

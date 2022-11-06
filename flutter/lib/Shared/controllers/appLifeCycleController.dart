import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class AppLifeCycleController extends GetxController
    with WidgetsBindingObserver {
  final bool logs;
  Map<AppLifecycleState, Map<String, VoidCallback>> callbacks =
      <AppLifecycleState, Map<String, VoidCallback>>{
    AppLifecycleState.detached: <String, VoidCallback>{},
    AppLifecycleState.inactive: <String, VoidCallback>{},
    AppLifecycleState.paused: <String, VoidCallback>{},
    AppLifecycleState.resumed: <String, VoidCallback>{},
  };

  AppLifeCycleController({this.logs = false});

  Rx<AppLifecycleState> _appState = AppLifecycleState.resumed.obs;
  AppLifecycleState get appState => _appState.value;
  StreamController<bool> _appResumedStreamController = StreamController<bool>();
  Stream<bool> get getAppResumedStream => _appResumedStreamController.stream;
  String attachCallback(AppLifecycleState onState, VoidCallback f) {
    final String callbackId = getRandomString(8);
    callbacks[onState]?[callbackId] = f;
    return callbackId;
  }

  void cleanCallbacksOfState(AppLifecycleState state) {
    callbacks[state]?.clear();
  }

  void removeCallbackIdOfState(AppLifecycleState state, [String? callbackId]) {
    callbacks[state]?.remove(callbackId);
  }

  void cleanAllCallbacks() {
    callbacks.keys.forEach((AppLifecycleState appLifecycleState) {
      callbacks[appLifecycleState]?.clear();
    });
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _appResumedStreamController.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _appState.value = state;
    callbacks[state]!.forEach((String callbackId, VoidCallback function) {
      function();
    });

    if (state == AppLifecycleState.resumed) {
      _appResumedStreamController.add(true);
    }

    mezDbgPrint("[+] AppLifeCycleController :: AppStateChanged :: $state");
  }
}

String getRandomString(int length) {
  const String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}

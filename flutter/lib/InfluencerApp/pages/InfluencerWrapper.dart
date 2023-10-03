// ignore_for_file: unawaited_futures

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/InfluencerApp/controllers/InfluencerAuthController.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;

dynamic _i18n() => Get.find<LanguageController>().strings['InfluencerApp']
    ['pages']['InfluencerWrapper'];

class InfluencerWrapper extends StatefulWidget {
  @override
  _InfluencerWrapperState createState() => _InfluencerWrapperState();
}

class _InfluencerWrapperState extends State<InfluencerWrapper> {
  AuthController authController = Get.find<AuthController>();
  InfluencerAuthController? influencerAuthController;

  AppLifeCycleController appLifeCycleController =
      Get.find<AppLifeCycleController>();

  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;

  @override
  void initState() {
    super.initState();
    _notificationsStreamListener = initializeShowNotificationsListener();
    logEventToServer("Influencer Wrapper init");
  }

  @override
  void dispose() {
    _notificationsStreamListener?.cancel();
    _notificationsStreamListener = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: _navBar(),
      body: Container(),
    );
  }
}

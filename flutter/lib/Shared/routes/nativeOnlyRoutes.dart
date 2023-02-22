import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mezcalmos/Shared/pages/AgoraCall.dart';
import 'package:mezcalmos/Shared/pages/AppNeedsUpdateScreen.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/NativeMessagingScreen.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';

// Routes Keys.

// GetX based Router (For navigating)
class NativeOnlyRoutes {
  static const String kAgoraCallScreen = '/agora';
  static const String kAppNeedsUpdate = '/needs_update';
  static List<GetPage> routes = [
    GetPage(name: kAgoraCallScreen, page: () => AgoraCall()),
    GetPage(
      name: SharedRoutes.kMessagesRoute,
      page: () => NativeMessagingScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 500),
      // customTransition:
    ),
    GetPage(name: kAppNeedsUpdate, page: () => AppNeedsUpdateScreen()),
  ];
}

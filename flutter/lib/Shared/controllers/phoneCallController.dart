import 'dart:async';
import 'package:callkeep/callkeep.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';

class PhoneCallController {
  // singleton.
  static PhoneCallController? _instance;
  PhoneCallController get instance => _instance ?? PhoneCallController();
  PhoneCallController() {
    assert(_instance == null);
    _instance = this;
    // setup!
    _callKeep.setup(
      null,
      <String, dynamic>{
        'ios': {
          'appName': getAppName(),
        },
        'android': {
          'alertTitle': 'Permissions required',
          'alertDescription':
              'This application needs to access your phone accounts',
          'cancelButton': 'Cancel',
          'okButton': 'ok',
          'foregroundService': {
            'channelId': getPackageName(),
            'channelName': 'Foreground service for my app',
            'notificationTitle': 'My app is running on background',
            'notificationIcon': 'Path to the resource icon of the notification',
          },
        },
      },
      backgroundMode: true,
    );
  }
  // Fields
  final FlutterCallkeep _callKeep = FlutterCallkeep();

  // Events
  void _onAnswerCallEvent({VoidCallback? onAnswerCallback}) {
    _callKeep.on(
      CallKeepPerformAnswerCallAction(),
      (CallKeepPerformAnswerCallAction event) {
        Timer(const Duration(seconds: 1), () => onAnswerCallback?.call());
      },
    );
  }

  void _onDeclineCallEvent({VoidCallback? onDeclineCallback}) {
    _callKeep.on(
      CallKeepPerformEndCallAction(),
      (CallKeepPerformEndCallAction event) => onDeclineCallback,
    );
  }

  Future<void> fireThePhoneCall({
    required String callUUID,
    required String callerId,
    required String callerName,
    VoidCallback? onAnswerCallback,
    VoidCallback? onDeclineCallback,
  }) async {
    // hook callbacks first
    _onAnswerCallEvent(onAnswerCallback: onAnswerCallback);
    _onDeclineCallEvent(onDeclineCallback: onDeclineCallback);
    // then display the call
    await _callKeep.displayIncomingCall(callUUID, callerId,
        localizedCallerName: callerName, hasVideo: false);
    // go back to forground
    _callKeep.backToForeground();
  }
}

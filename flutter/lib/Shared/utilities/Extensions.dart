import 'dart:async';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart'
    show mezDbgPrint;

class MezDisposable {
  // index 0 => sub
  // index 1 => debugId
  List<dynamic> _subscriptions = [];

  Future<void> cancelSubscriptions() async {
    await Future.forEach<dynamic>(_subscriptions, (subscription) async {
      mezDbgPrint(
          "\n\n[ MEZ-DISPOSABLE  ${subscription[1]} ] :: CLOSED SUBSCRIPTION  :: ${subscription[0].toString()} \n\n");
      await subscription[0].cancel();
    });
  }

  void addSubscription(StreamSubscription subscription, String debugId) {
    mezDbgPrint(
        "\n\n[ MEZ-DISPOSABLE EXTENSION $debugId ] :: ADDED SUBSCRIPTION :: ${subscription.toString()} \n\n");
    _subscriptions.add([subscription, debugId]);
  }
}

// this is to use on widgets's dispose method to close all StreamSubscriptions. Sicne we use that a lot
extension DisposableStreamSubscriton on StreamSubscription {
  void canceledBy(MezDisposable _, {String debugId = ""}) {
    _.addSubscription(this, debugId);
  }
}

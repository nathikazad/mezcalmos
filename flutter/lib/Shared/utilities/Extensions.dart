import 'dart:async';

class MezDisposable {
  List<StreamSubscription> _subscriptions = [];

  Future<void> cancelSubscriptions() async {
    await Future.forEach<StreamSubscription>(_subscriptions,
        (subscription) async {
      print(
          "\n\n[ MEZ-DISPOSABLE EXTENSION ] :: CLOSED SUBSCRIPTION :: ${subscription.toString()} \n\n");
      await subscription.cancel();
    });
  }

  void addSubscription(StreamSubscription subscription) {
    print(
        "\n\n[ MEZ-DISPOSABLE EXTENSION ] :: ADDED SUBSCRIPTION :: ${subscription.toString()} \n\n");
    _subscriptions.add(subscription);
  }
}

// this is to use on widgets's dispose method to close all StreamSubscriptions. Sicne we use that a lot
extension DisposableStreamSubscriton on StreamSubscription {
  void canceledBy(MezDisposable _) {
    _.addSubscription(this);
  }
}

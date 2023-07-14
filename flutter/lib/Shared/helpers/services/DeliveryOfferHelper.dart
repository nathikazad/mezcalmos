import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

extension CounterOfferExpiry on CounterOffer {
  String get expiryTimeFormatted {
    final DateTime date = DateTime.parse(expiryTime);
    final DateFormat format = DateFormat('hh:mm a');
    return format.format(date);
  }

  bool get isRequested {
    return status == CounterOfferStatus.Requested;
  }

  bool get isExpired {
    final DateTime date = DateTime.parse(expiryTime);
    return DateTime.now().isAfter(date);
  }
}

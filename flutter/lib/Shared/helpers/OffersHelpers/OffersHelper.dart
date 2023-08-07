import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

extension OffersHelper on Offer {
  bool get isActive {
    // Check if the offer is active based on its validity dates and weeklyRepeat flag.
    if (details.validityRangeStart != null &&
        details.validityRangeEnd != null &&
        status == OfferStatus.Active) {
      final DateTime now = DateTime.now();
      final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      final DateTime startDate = dateFormat.parse(details.validityRangeStart!);
      final DateTime endDate = dateFormat.parse(details.validityRangeEnd!);

      if (now.isAfter(startDate) && now.isBefore(endDate)) {
        return true;
      }
    }
    return false;
  }

  DateTime? get startDate {
    if (details.validityRangeStart != null) {
      return DateTime.parse(details.validityRangeStart!);
    }
    return null;
  }

  DateTime? get endDate {
    if (details.validityRangeEnd != null) {
      return DateTime.parse(details.validityRangeEnd!);
    }
    return null;
  }

  IconData get icon {
    switch (offerType) {
      case OfferType.Coupon:
        return Icons.discount_rounded;
      case OfferType.Promotion:
        return Icons.price_check;
      case OfferType.MonthlySubscription:
        return Icons.workspace_premium_rounded;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

extension BusinessOrderRequestStatusExtensions on BusinessOrderRequestStatus {
  String toReadableString() {
    switch (this) {
      case BusinessOrderRequestStatus.RequestReceived:
        return "Pending";
      case BusinessOrderRequestStatus.ModificationRequestByBusiness:
        return "Waiting for customer";
      case BusinessOrderRequestStatus.CancelledByCustomer:
      case BusinessOrderRequestStatus.CancelledByBusiness:
        return "Cancelled";
      case BusinessOrderRequestStatus.Confirmed:
        return "Confirmed";

      case BusinessOrderRequestStatus.Completed:
        return "Completed";
      default:
        return "";
    }
  }

  IconData getIcon() {
    switch (this) {
      case BusinessOrderRequestStatus.RequestReceived:
        return Icons.pending;
      case BusinessOrderRequestStatus.ModificationRequestByBusiness:
        return Icons.hourglass_top;
      case BusinessOrderRequestStatus.CancelledByBusiness:
        return Icons.cancel;
      case BusinessOrderRequestStatus.Confirmed:
        return Icons.check_circle;
      case BusinessOrderRequestStatus.CancelledByCustomer:
        return Icons.cancel;
      case BusinessOrderRequestStatus.Completed:
        return Icons.check_circle;
      default:
        return Icons.error_outline;
    }
  }
}

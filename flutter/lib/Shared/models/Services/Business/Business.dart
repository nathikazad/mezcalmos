import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

class BusinessCardView {
  int id;
  int detailsId;
  String name;
  String image;
  Map<PaymentType, bool> acceptedPayments;
  double? avgRating;
  int? reviewCount;

  BusinessCardView(
      {required this.id,
      required this.detailsId,
      required this.name,
      required this.image,
      required this.acceptedPayments,
      this.avgRating,
      this.reviewCount});
}

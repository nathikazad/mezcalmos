import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["helpers"]
    ["GeneralPurposeHelper"];

class CustAddReviewButton extends StatelessWidget {
  const CustAddReviewButton(
      {super.key,
      required this.toEntityId,
      required this.toEntityType,
      required this.orderId});
  final int toEntityId;
  final ServiceProviderType toEntityType;
  final int orderId;

  @override
  Widget build(BuildContext context) {
    return MezButton(
      label: "${_i18n()['writeReview']}",
      withGradient: true,
      borderRadius: 0,
      height: 80,
      onClick: () async {
        int? res = await addReviewDialog(
            context: context,
            toEntityId: toEntityId,
            toEntityType: toEntityType,
            fromEntityId: Get.find<AuthController>().hasuraUserId!,
            fromEntityType: ServiceProviderType.Customer,
            orderId: orderId);
        if (res != null) {
          await Get.find<CustomerAuthController>().setReviewId(
              reviewId: res, orderId: orderId, entityType: toEntityType);
        }
      },
    );
  }
}

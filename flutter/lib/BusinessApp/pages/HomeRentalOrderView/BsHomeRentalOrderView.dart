import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/HomeRentalOrderView/components/BsHomeRentalOrderItemCard.dart';
import 'package:mezcalmos/BusinessApp/pages/HomeRentalOrderView/components/BsHomeRentalOrderSatusCard.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderNoteCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderPaymentMethod.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderSummaryCard.dart';

class BsHomeRentalOrderView extends StatefulWidget {
  const BsHomeRentalOrderView({super.key});
  static Future<void> navigate({required int orderId}) async {
    return await MezRouter.toPath(
        BusinessOpRoutes.kBsOpHomeRentalOrder.replaceFirst(":id", "$orderId"));
  }

  @override
  State<BsHomeRentalOrderView> createState() => _BsHomeRentalOrderViewState();
}

class _BsHomeRentalOrderViewState extends State<BsHomeRentalOrderView> {
  int? orderId;
  @override
  void initState() {
    orderId = int.tryParse(MezRouter.urlArguments["id"].toString());
    if (orderId == null) {
      showErrorSnackBar(
          errorText: "Invalid order id", duration: const Duration(seconds: 3));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          title: 'Home for rent', onClick: MezRouter.back),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BsHomeRentalOrderSatusCard(),
            meduimSeperator,
            MezCard(
                firstAvatarBgImage:
                    CachedNetworkImageProvider(defaultUserImgUrl),
                action: MessageButton(
                  chatId: 1,
                  onTap: () {},
                ),
                content: Text(
                  "Customer name",
                  style: context.textTheme.bodyLarge,
                )),
            meduimSeperator,
            Column(
              children:
                  List.generate(2, (int index) => BsHomeRentalOrderItemCard()),
            ),
            OrderPaymentMethod(
                paymentType: PaymentType.Card, stripeOrderPaymentInfo: null),
            meduimSeperator,
            OrderNoteCard(note: "note"),
            meduimSeperator,
            OrderSummaryCard(
                showNullValues: false,
                costs: OrderCosts(
                    deliveryCost: null,
                    refundAmmount: null,
                    tax: null,
                    orderItemsCost: 5,
                    totalCost: 5),
                stripeOrderPaymentInfo: null),
            meduimSeperator,
            MezButton(
              label: "Cancel order",
              onClick: () async {},
              backgroundColor: offRedColor,
              textColor: redAccentColor,
            )
          ],
        ),
      ),
    );
  }
}

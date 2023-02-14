import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCardsListView/controllers/CustCardsListViewController.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["cards"]["SavedCardsListView"];

//
class CustCardsListView extends StatefulWidget {
  const CustCardsListView({Key? key}) : super(key: key);

  @override
  State<CustCardsListView> createState() => _CustCardsListViewState();
}

class _CustCardsListViewState extends State<CustCardsListView> {
  CustCardsListViewController viewController = CustCardsListViewController();

  @override
  void initState() {
    viewController.init();
    //   cards.value = controller.customer!.savedCards;
    // TODO: hasura-ch
    // cardsStream = controller.customer?.listen((Customer? event) {
    //   if (event != null) {
    //     cards.value = event.savedCards;
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          title: '${_i18n()["cards"]}',
          onClick: MezRouter.back,
          showNotifications: true),
      body: Obx(
        () => SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                // cards list
                if (viewController.stripeInfo.value != null)
                  Container(
                    child: Column(
                      children: List.generate(
                          viewController.cards.length,
                          (int index) => Container(
                              margin: EdgeInsets.only(bottom: 1.h),
                              child: _creditCardCard(
                                  viewController.cards[index]))),
                    ),
                  ),
                MezAddButton(
                  onClick: () async {
                    await addCardSheet()
                        .whenComplete(() => viewController.fetchCards());
                  },
                  btnColor: Colors.grey.shade200,
                  title: '${_i18n()["addNew"]}',
                )
              ],
            )),
      ),
    );
  }

  Card _creditCardCard(CreditCard card) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Row(
          children: [
            Icon(card.brand.toIcon()),
            SizedBox(
              width: 15,
            ),
            Text(
              '${_i18n()["card"]}',
              style: Get.textTheme.bodyText1,
            ),
            SizedBox(
              width: 15,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Text("•" * 12 + "${card.last4}"),
            ),
            // InkWell(
            //   customBorder: CircleBorder(),
            //   onTap: () {
            //     showConfirmationDialog(context,
            //         title: '${_i18n()["removeTitle"]}',
            //         helperText: '${_i18n()["removeDesc"]}',
            //         primaryButtonText: '${_i18n()["removeBtn"]}',
            //         onYesClick: () async {
            //       await viewController
            //           .deleteCard(cardId: card.id)
            //           .then((bool response) {
            //         if (!response) {
            //           MezSnackbar("Error", "error");
            //         } else {
            //           MezRouter.popDialog(closeOverlays: true);
            //         }
            //       });
            //     });
            //   },
            //   child: Ink(
            //     padding: const EdgeInsets.all(7),
            //     decoration:
            //         BoxDecoration(shape: BoxShape.circle, color: offRedColor),
            //     child: Center(
            //       child: Icon(
            //         FontAwesomeIcons.trashCan,
            //         size: 14.sp,
            //         color: Colors.red,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

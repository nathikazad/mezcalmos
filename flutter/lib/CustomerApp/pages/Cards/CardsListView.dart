import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StripeHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["cards"]["SavedCardsListView"];

//
class SavedCardsListView extends StatefulWidget {
  const SavedCardsListView({Key? key}) : super(key: key);

  @override
  State<SavedCardsListView> createState() => _SavedCardsListViewState();
}

class _SavedCardsListViewState extends State<SavedCardsListView> {
  CustomerAuthController controller = Get.find<CustomerAuthController>();
  StreamSubscription? cardsStream;
  RxList<CreditCard> cards = RxList([]);
  @override
  void initState() {
    cards.value = controller.customer.value!.savedCards;
    cardsStream = controller.customer.stream.listen((Customer? event) {
      if (event != null) {
        cards.value = event.savedCards;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          title: '${_i18n()["cards"]}', onClick: Get.back),
      body: Obx(
        () => SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                // cards list
                Container(
                  child: Column(
                    children: List.generate(cards.length,
                        (int index) => _creditCardCard(cards[index])),
                  ),
                ),
                MezAddButton(
                  onClick: () async {
                    await addCardSheet();
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
            InkWell(
              customBorder: CircleBorder(),
              onTap: () {
                showConfirmationDialog(context,
                    title: '${_i18n()["removeTitle"]}',
                    helperText: '${_i18n()["removeDesc"]}',
                    primaryButtonText: '${_i18n()["removeBtn"]}',
                    onYesClick: () async {
                  await removeCard(cardId: card.id)
                      .whenComplete(() => Get.back());
                });
              },
              child: Ink(
                padding: const EdgeInsets.all(7),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: offRedColor),
                child: Center(
                  child: Icon(
                    FontAwesomeIcons.trashCan,
                    size: 14.sp,
                    color: Colors.red,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

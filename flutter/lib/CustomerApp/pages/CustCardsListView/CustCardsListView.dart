import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCardsListView/controllers/CustCardsListViewController.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["cards"]["SavedCardsListView"];

//
class CustCardsListView extends StatefulWidget {
  const CustCardsListView({Key? key}) : super(key: key);
  static Future<void> navigate() {
    return MezRouter.toPath(CustomerRoutes.savedCards);
  }

  @override
  State<CustCardsListView> createState() => _CustCardsListViewState();
}

class _CustCardsListViewState extends State<CustCardsListView> {
  CustCardsListViewController viewController = CustCardsListViewController();

  @override
  void initState() {
    viewController.init();

    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          title: '${_i18n()["cards"]}',
          onClick: MezRouter.back,
          showNotifications: true),
      body: Obx(
        () => SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                if (viewController.hasData)
                  Container(
                    child: Column(
                      children: List.generate(
                          viewController.cards.length,
                          (int index) => Container(
                              margin: EdgeInsets.only(bottom: 4),
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
              style: context.txt.bodyLarge,
            ),
            SizedBox(
              width: 15,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Text("•" * 12 + "${card.last4}"),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:mezcalmos/CustomerApp/models/Cart.dart';
// import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/ViewItemScreenCartComponent.dart';
// import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/TitlesComponent.dart';
// import 'package:mezcalmos/Shared/controllers/languageController.dart';
// import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
// import 'package:mezcalmos/Shared/models/Generic.dart';
// import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

// final currency = new NumberFormat("#,##0.00", "en_US");
// dynamic _i18n() =>
//     Get.find<LanguageController>().strings["CustomerApp"]["pages"]
//     ["Restaurants"]["ViewItemScreen"]["components"]["ChoosenManyCheckBox"];

// class ChooseManyCheckBoxes extends StatelessWidget {
//   final List<ChooseManyOption> chooseManyOptions;
//   final Rxn<CartItem> cartItem;
//   LanguageType userLanguage = Get.find<LanguageController>().userLanguageKey;

//   ChooseManyCheckBoxes(
//       {required this.cartItem, required this.chooseManyOptions});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ...getHeadTitles(),
//         ...chooseManyOptions.map((manyOptions) {
//           mezDbgPrint(
//               "====>> Chosen Item ? ${cartItem.value!.findChooseManyItemById(manyOptions.idInCart)?.chosen}");
//           return ViewItemScreenCartComponent(
//             title: manyOptions.name[userLanguage]!,
//             price: manyOptions.cost > 0
//                 ? "\$${currency.format(manyOptions.cost)}"
//                 : null,
//             initialVal: cartItem.value!
//                     .findChooseManyItemById(manyOptions.idInCart)
//                     ?.chosen ==
//                 true,
//             onValueChanged: (val) {
//               cartItem.value!.setNewChooseManyItem(
//                   chooseManyOptionId: manyOptions.idInCart,
//                   newVal: val ?? false);
//               cartItem.refresh();
//             },
//           );
//         })
//       ],
//     );
//   }

//   List<Widget> getHeadTitles() {
//     List<Widget> _lst = [];
//     if (chooseManyOptions.length > 0) {
//       _lst.addAll([
//         MenuTitles(
//           title: _i18n()['optional'],
//         ),
//         SizedBox(
//           height: 15,
//         )
//       ]);
//     }
//     return _lst;
//   }
// }

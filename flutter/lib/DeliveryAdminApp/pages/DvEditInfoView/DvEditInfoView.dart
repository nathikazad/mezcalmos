// import 'package:flutter/material.dart';
// import 'package:mezcalmos/Shared/MezRouter.dart';
// import 'package:mezcalmos/Shared/widgets/AppBar.dart';

// class DvEditInfoView extends StatefulWidget {
//   const DvEditInfoView({super.key});

//   @override
//   State<DvEditInfoView> createState() => _DvEditInfoViewState();
// }

// class _DvEditInfoViewState extends State<DvEditInfoView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,onClick: MezRouter.back,title: "Info"),
//       body:  SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
//             child: Obx(
//               () => Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ROpImageEditComponent(editInfoController: editInfoController),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     child: Text(
//                       editInfoController.restaurant.value?.info.name ?? "",
//                       style: Get.textTheme.headline3,
//                     ),
//                   )
//                   // Laundry name fiels
//                   ,
//                   SizedBox(
//                     height: 25,
//                   ),
//                   Text('${_i18n()["restaurantName"]}'),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   _restNameTextField(),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                       '${_i18n()["description"]} ${editInfoController.primaryLang.value?.toLanguageName()}'),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   _prdescTextField(),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                       '${_i18n()["description"]} ${editInfoController.secondaryLang.value?.toLanguageName()}'),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   _scdescTextField(),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     '${_i18n()["location"]}',
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   ROpEditLocationCard(
//                     editInfoController: editInfoController,
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Text("${_i18n()["defaultLanguage"]}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   ROpLanguageSelectorComponent(
//                       languageValue: editInfoController.editablePrLang,
//                       oppositeLanguageValue: editInfoController.editableScLang,
//                       onChangeShouldUpdateLang:
//                           editInfoController.changePrimaryLang),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Text("${_i18n()["secondaryLanguage"]}"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   ROpLanguageSelectorComponent(
//                     languageValue: editInfoController.editableScLang,
//                     oppositeLanguageValue: editInfoController.editablePrLang,
//                     onChangeShouldUpdateLang:
//                         editInfoController.changePrimaryLang,
//                     isSecondary: true,
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),,
//     );
//   }
// }

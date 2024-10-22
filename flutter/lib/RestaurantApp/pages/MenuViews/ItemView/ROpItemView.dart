import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/components/ItemCategorySelector.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/components/ROpItemAvChips.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/components/ROpItemImage.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/components/ROpSpecialItemTime.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/components/RopItemOptionCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/controllers/ItemViewController.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/ROpOptionView.dart';
import 'package:mezcalmos/RestaurantApp/router/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpItemView"];

//
class ROpItemView extends StatefulWidget {
  const ROpItemView({Key? key}) : super(key: key);

  static Future<bool?> navigate(
      {required int restaurantId,
      required int detailsId,
      required int? itemId,
      int? categoryId,
      required Map<String, dynamic> arguments}) async {
    String route = RestaurantAppRoutes.restaurantItemRoute
        .replaceAll(":restaurantId", restaurantId.toString());
    if (categoryId != null) {
      route = route.replaceFirst(":categoryId", "$categoryId");
    }
    if (itemId != null) {
      route = route.replaceFirst(":itemId", "$itemId");
    }
    await MezRouter.toPath(route, arguments: {"detailsId": detailsId});
    return MezRouter.backResult;
  }

  // static Future<void> navigateToAdd(
  //     {required int restaurantId, required Map<String, dynamic> arguments}) {
  //   return MezRouter.toPath(
  //       RestaurantRouter.restaurantAddItemRoute
  //           .replaceAll(":restaurantId", restaurantId.toString()),
  //       arguments: arguments);
  // }

  @override
  _ROpItemViewState createState() => _ROpItemViewState();
}

class _ROpItemViewState extends State<ROpItemView>
    with SingleTickerProviderStateMixin {
  // late TabController _tabController;
  int? restuarantID;
  int? detailsId;
  int? itemId;
  int? categoryId;
  bool? specials;
  ROpItemViewController viewController = ROpItemViewController();

  @override
  void initState() {
    itemId = int.tryParse(MezRouter.urlArguments["itemId"].toString());
    categoryId = int.tryParse(MezRouter.urlArguments["categoryId"].toString());
    detailsId = int.tryParse(MezRouter.bodyArguments!["detailsId"].toString());

    restuarantID =
        int.tryParse(MezRouter.urlArguments["restaurantId"].toString());
    mezDbgPrint("Restuarnt id in item view ============> $restuarantID");
    if (restuarantID != null && detailsId != null) {
      viewController.init(
          itemId: itemId,
          categoryId: categoryId,
          detailsId: detailsId!,
          vsync: this,
          specials: specials,
          restaurantId: restuarantID!);
    } else
      showErrorSnackBar();

    super.initState();
  }

  @override
  void dispose() {
    // _tabController.dispose();
    viewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (viewController.isInitalized.isTrue &&
            viewController.tabController != null) {
          return Scaffold(
              appBar: _appBar(),
              bottomNavigationBar: _saveBtn(),
              body: TabBarView(
                controller: viewController.tabController,
                children: [
                  _primaryTab(),
                  if (viewController.hasSecondaryLang) _secondaryTab(),
                ],
              ));
        } else {
          return Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: MezLogoAnimation(centered: true),
          );
        }
      },
    );
  }

  Widget _saveBtn() {
    return Obx(
      () => MezButton(
        height: 65,
        withGradient: true,
        borderRadius: 0,
        label: (viewController.editMode.isTrue)
            ? '${_i18n()["saveItem"]}'
            : '${_i18n()["addItem"]}',
        onClick: () async {
          await _handleSaveBtn();
        },
      ),
    );
  }

  AppBar _appBar() {
    return MezcalmosAppBar(AppBarLeftButtonType.Back, onClick: () {
      MezRouter.back(backResult: viewController.needToRefetch.value);
    },
        title: '${_i18n()["item"]}',
        showNotifications: true,
        tabBar: viewController.hasSecondaryLang
            ? TabBar(controller: viewController.tabController, tabs: [
                Tab(
                    child: Text(
                        "${viewController.languages!.primary.toLanguageName()}")),
                Tab(
                    child: Text(
                        "${viewController.languages!.secondary?.toLanguageName() ?? ""}")),
              ])
            : null);
  }

  Widget _secondaryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: viewController.secondaryFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Text(
              '${_i18n()["itemName"]}',
              style: context.txt.bodyLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: context.txt.bodyLarge,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: viewController.scItemNameController,
              validator: (String? value) {
                // TODO validations
                if (value == null || value.isEmpty) {
                  return '${_i18n()["required"]}';
                }
                return null;
              },
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              '${_i18n()["itemDesc"]}',
              style: context.txt.bodyLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: context.txt.bodyLarge,
              minLines: 4,
              maxLines: 6,
              controller: viewController.scItemDescController,
            ),
          ],
        ),
      ),
    );
  }

  Widget _primaryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: viewController.primaryFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ROpItemImage(
              viewController: viewController,
            ),
            if (viewController.editMode.isTrue)
              ROpItemAvChips(
                viewController: viewController,
              ),
            const SizedBox(
              height: 35,
            ),
            if (viewController.specialMode.isTrue)
              ROpSpecialItemTime(viewController: viewController),
            Text(
              '${_i18n()["itemName"]}',
              style: context.txt.bodyLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: context.txt.bodyLarge,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: viewController.prItemNameController,
              validator: (String? value) {
                // TODO validations
                if (value == null || value.isEmpty) {
                  return '${_i18n()["required"]}';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              '${_i18n()["itemPrice"]}',
              style: context.txt.bodyLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: viewController.itemPriceController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return '${_i18n()["required"]}';
                }
                return null;
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
              ],
              textAlignVertical: TextAlignVertical.center,
              style: context.txt.bodyLarge,
              decoration: InputDecoration(
                  prefixIconColor: primaryBlueColor,
                  prefixIcon: Icon(Icons.attach_money)),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              '${_i18n()["itemDesc"]}',
              style: context.txt.bodyLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: context.txt.bodyLarge,
              maxLines: 6,
              minLines: 4,
              controller: viewController.prItemDescController,
            ),
            const SizedBox(
              height: 25,
            ),
            if (viewController.specialMode.value == false)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_i18n()["category"]}',
                    style: context.txt.bodyLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ROpItemCategorySelector(viewController: viewController),
                ],
              ),
            const SizedBox(
              height: 25,
            ),
            Text(
              '${_i18n()["itemOptions"]}',
              style: context.txt.bodyLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() {
              if (viewController.isEditing) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ROpItemOptionCard(
                      viewController: viewController,
                      itemId: viewController.editableItem.value!.id!,
                      restaurantID: restuarantID!,
                      categoryID: categoryId,
                    ),
                    MezAddButton(
                      title: '${_i18n()["addOption"]}',
                      onClick: () async {
                        final bool? result = await ROpOptionView.navigate(
                            restaurantId: restuarantID!,
                            restaurantDetailsId: detailsId!,
                            optionId: null,
                            itemId: viewController.editableItem.value!.id!);
                        if (result == true) {
                          await viewController.fetchItem();
                        }
                      },
                    ),
                    _deleteItemBtn(),
                  ],
                );
              } else {
                return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      "Save item so you can manage options and choices ...",
                      textAlign: TextAlign.center,
                    ));
              }
            })
          ],
        ),
      ),
    );
  }

  Widget _deleteItemBtn() {
    return Obx(() {
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: (viewController.editMode.value)
              ? TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.redAccent,
                      backgroundColor: offRedColor),
                  onPressed: () {
                    showConfirmationDialog(context, onYesClick: () async {
                      await viewController
                          .deleteItem(itemId: itemId!, catgeoryId: categoryId)
                          .then((bool? value) {
                        if (value == true) {
                          MezRouter.back(backResult: true);
                        }
                      });
                    },
                        title: '${_i18n()["deleteTitle"]}',
                        primaryButtonText: '${_i18n()["deleteBtn"]}',
                        helperText: "${_i18n()["deleteHelper"]}");
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("${_i18n()["deleteItem"]}"),
                        ],
                      )))
              : null);
    });
  }

  Future<void> _handleSaveBtn() async {
    if (viewController.validate) {
      await viewController.saveItem();
    }
  }
}

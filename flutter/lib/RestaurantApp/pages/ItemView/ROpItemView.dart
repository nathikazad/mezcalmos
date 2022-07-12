import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/components/ItemCategorySelector.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/components/ROpItemImage.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/components/RopItemOptionCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/controllers/ItemViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/CallToActionButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';

class ROpItemView extends StatefulWidget {
  const ROpItemView({Key? key}) : super(key: key);

  @override
  _ROpItemViewState createState() => _ROpItemViewState();
}

class _ROpItemViewState extends State<ROpItemView>
    with SingleTickerProviderStateMixin {
  StreamSubscription? _restaurantListener;
  late TabController _tabController;
  String? itemId;
  String? categoryId;
  ItemViewController viewController = ItemViewController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    itemId = Get.parameters["itemId"];
    categoryId = Get.parameters["categoryId"];
    _tabController = TabController(length: 2, vsync: this);
    viewController.init(itemId: itemId, categoryId: categoryId);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    viewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: Get.back,
          title: "Item",
          showNotifications: true,
          tabBar: TabBar(controller: _tabController, tabs: [
            Tab(
              text:
                  "${viewController.restaurant.value!.primaryLanguage.toLanguageName()}",
            ),
            Tab(
              text:
                  "${viewController.restaurant.value!.secondaryLanguage!.toLanguageName()}",
            ),
          ])),
      bottomNavigationBar: Obx(
        () => CallToActionButton(
          height: 65,
          isLoading: viewController.isLoading,
          text: (viewController.editMode.isTrue) ? "Save item" : "Add item",
          onTap: () {
            if (viewController.isSecondLangValid) {
              _tabController.index = _tabController.length - 2;
              if (_formKey.currentState!.validate()) {
                mezDbgPrint("Calling save");
                viewController.saveItem();
              }
            } else {
              _tabController.index = _tabController.length - 1;
              _formKey.currentState!.validate();
            }
          },
        ),
      ),
      body: Obx(
        () {
          if (viewController.restaurant.value != null) {
            return Form(
              key: _formKey,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _primaryTab(),
//
                  _secondaryTab()
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  SingleChildScrollView _secondaryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            "Item name",
            style: Get.textTheme.bodyText1,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            style: Get.textTheme.bodyText1,
            controller: viewController.scItemNameController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Required";
              }
              return null;
            },
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Item Description",
            style: Get.textTheme.bodyText1,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            style: Get.textTheme.bodyText1,
            minLines: 4,
            maxLines: 6,
            controller: viewController.scItemDescController,
          ),
        ],
      ),
    );
  }

  Widget _primaryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ROpItemImage(
            viewController: viewController,
          ),
          const SizedBox(
            height: 35,
          ),
          Text(
            "Item name",
            style: Get.textTheme.bodyText1,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            style: Get.textTheme.bodyText1,
            controller: viewController.prItemNameController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Required";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Item Price",
            style: Get.textTheme.bodyText1,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: viewController.itemPriceController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Required";
              }
              return null;
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
            ],
            textAlignVertical: TextAlignVertical.center,
            style: Get.textTheme.bodyText1,
            decoration: InputDecoration(
                prefixIconColor: primaryBlueColor,
                prefixIcon: Icon(Icons.attach_money)),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Item Description",
            style: Get.textTheme.bodyText1,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            style: Get.textTheme.bodyText1,
            maxLines: 6,
            minLines: 4,
            controller: viewController.prItemDescController,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Category",
            style: Get.textTheme.bodyText1,
          ),
          const SizedBox(
            height: 10,
          ),
          ROpItemCategorySelector(viewController: viewController),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Item options",
            style: Get.textTheme.bodyText1,
          ),
          const SizedBox(
            height: 10,
          ),
          ROpItemOptionCard(viewController: viewController),
          MezAddButton(
            title: "Add option",
            onClick: () async {
              final Option? newOption =
                  await Get.toNamed(kOptionView) as Option?;
              if (newOption != null) {
                mezDbgPrint("From item view ===> ${newOption.toJson()}");
                viewController.addOption(newOption);
              }
            },
          ),
          _deleteItemBtn()
        ],
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
                      backgroundColor: offRedColor, primary: Colors.redAccent),
                  onPressed: () {
                    showConfirmationDialog(context, onYesClick: () async {
                      await viewController
                          .deleteItem(itemId: itemId!, catgeoryId: categoryId)
                          .then((value) => Get.back());
                    },
                        title: "Delete this item",
                        helperText:
                            "Are you sure you want to delete this item ");
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
                          Text("Delete item"),
                        ],
                      )))
              : null);
    });
  }
}

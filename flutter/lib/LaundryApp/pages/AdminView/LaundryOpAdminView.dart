import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/Components/CategoryGridCard.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/Components/LaundryOpNormalDeliveryTime.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class LaundryOpAdminView extends StatefulWidget {
  const LaundryOpAdminView({Key? key}) : super(key: key);

  @override
  State<LaundryOpAdminView> createState() => _LaundryOpAdminViewState();
}

class _LaundryOpAdminViewState extends State<LaundryOpAdminView> {
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  Rxn<Laundry> laundry = Rxn();

  StreamSubscription? laundryListener;

  @override
  void initState() {
    laundry = laundryInfoController.laundry;
    laundryListener =
        laundryInfoController.laundry.stream.listen((Laundry? event) {
      laundry.value = event;
    });
    super.initState();
  }

  @override
  void dispose() {
    laundryListener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: Get.back,
          actionIcons: [
            // todo add orders and notifs buttons
          ]),
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage: CachedNetworkImageProvider(
                            laundryInfoController.laundry.value!.info.image)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      laundryInfoController.laundry.value!.info.name,
                      style: Get.textTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  _categoriesGridList(),
                  SizedBox(
                    height: 25,
                  ),
                  LaundryOpNormalDeliveryTime()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoriesGridList() {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List<Widget>.generate(
              laundry.value!.laundryCosts.lineItems.length, (int index) {
            return CategoryGridCard(
                item: laundry.value!.laundryCosts.lineItems[index]);
          }) +
          [
            Card(
              color: Colors.grey.shade200,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(kCategoryView);
                },
                child: Container(
                  child: Icon(
                    Icons.add_circle_outline,
                    size: 25,
                    color: primaryBlueColor,
                  ),
                ),
              ),
            )
          ],
    );
  }
}

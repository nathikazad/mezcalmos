import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/Components/LaundryAppAppBar.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/Components/CategoryGridCard.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/Components/LaundryOpNormalDeliveryTime.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/Components/MinmumCostCard.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]["pages"]
    ["AdminView"]["LaundryOpAdminView"];
//

class LaundryOpAdminView extends StatefulWidget {
  const LaundryOpAdminView({Key? key}) : super(key: key);

  @override
  State<LaundryOpAdminView> createState() => _LaundryOpAdminViewState();
}

class _LaundryOpAdminViewState extends State<LaundryOpAdminView> {
  late OpLaundryInfoController laundryInfoController;

  Rxn<Laundry> laundry = Rxn();
  Rxn<num> avgDays = Rxn();
  RxBool btnClicked = RxBool(false);
  Rxn<num> minCost = Rxn();
  String? laundryId;

  StreamSubscription? laundryListener;

  @override
  void initState() {
    // laundry = laundryInfoController.getLaundry(laundryOpAuthController.laundryId!).;
    // avgDays.value = laundry.value!.averageNumberOfDays;
    laundryId = Get.parameters["laundryId"];
    if (laundryId != null) {
      _getLaundry(laundryId!);

      super.initState();
    }
  }

  Future<void> _getLaundry(String laundryId) async {
    Get.put(OpLaundryInfoController(), permanent: false);
    laundryInfoController = Get.find<OpLaundryInfoController>();
    laundry.value = await laundryInfoController.getLaundryAsFuture(laundryId);
    avgDays.value = laundry.value!.averageNumberOfDays;
    minCost.value = laundry.value!.laundryCosts.minimumCost;
    laundryListener =
        laundryInfoController.getLaundry(laundryId).listen((Laundry? event) {
      if (event != null) {
        laundry.value = event;
        avgDays.value = event.averageNumberOfDays;
        minCost.value = event.laundryCosts.minimumCost;
      } else {
        Get.back();
      }
    });
  }

  @override
  void dispose() {
    Get.delete<OpLaundryInfoController>();
    laundryListener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LaundryAppAppBar(
        leftBtnType: AppBarLeftButtonType.Back,
        onClick: Get.back,
      ),
      bottomNavigationBar: Obx(() {
        if (laundry.value != null) {
          return _footerSaveButton();
        } else
          return SizedBox();
      }),
      body: Obx(
        () {
          if (laundry.value != null) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(12),
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
                                laundry.value!.info.image)),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          laundry.value!.info.name,
                          style: Get.textTheme.headline3
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: Text(
                          "${_i18n()["categories"]}",
                          style: Get.textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _categoriesGridList(),
                      SizedBox(
                        height: 25,
                      ),
                      Obx(
                        () => LaundryOpNormalDeliveryTime(
                          data: avgDays.value!,
                          onTapPlus: () {
                            avgDays.value = avgDays.value! + 1;
                          },
                          onTapMinus: () {
                            if (avgDays.value! > 1) {
                              avgDays.value = avgDays.value! - 1;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      LaundryOpMinimumCost(
                        minCost: minCost,
                      ),
                    ],
                  )
                ],
              ),
            );
          } else {
            return MezLogoAnimation(
              centered: true,
            );
          }
        },
      ),
    );
  }

  Widget _footerSaveButton() {
    return Obx(() {
      if (_shouldUSave()) {
        return InkWell(
          onTap: () {
            saveInfo();
          },
          child: Ink(
              height: 55,
              decoration: BoxDecoration(gradient: bluePurpleGradient),
              child: Center(
                child: btnClicked.isTrue
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        "${_i18n()["save"]}",
                        style: Get.textTheme.bodyText1
                            ?.copyWith(color: Colors.white),
                      ),
              )),
        );
      } else {
        return Container(
          height: 1,
        );
      }
    });
  }

  Widget _categoriesGridList() {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      childAspectRatio: MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height / 1.3),
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List<Widget>.generate(
              laundry.value!.laundryCosts.lineItems.length, (int index) {
            return CategoryGridCard(
              item: laundry.value!.laundryCosts.lineItems[index],
              laundry: laundry.value!,
            );
          }) +
          [
            Card(
              color: Colors.grey.shade200,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(getCategoryRoute(
                      laundryId: laundryId!, categoryId: null));
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

  bool _shouldUSave() {
    return avgDays.value != laundry.value!.averageNumberOfDays ||
        minCost.value != laundry.value!.laundryCosts.minimumCost;
  }

  void saveInfo() {
    if (avgDays.value != null) {
      btnClicked.value = true;
      laundryInfoController
          .setAverageNumberOfDays(
              averageNumberOfDays: avgDays.value!, laundryId: laundryId!)
          .whenComplete(() => btnClicked.value = false);
    }
    if (minCost.value != null) {
      btnClicked.value = true;
      laundryInfoController
          .setMinCost(laundryId: laundryId!, minCost: minCost.value!)
          .whenComplete(() {
        FocusScope.of(context).unfocus();
        return btnClicked.value = false;
      });
    }
  }
}

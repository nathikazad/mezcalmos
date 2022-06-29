import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/Components/LaundryAppAppBar.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/Components/CategoryGridCard.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/Components/LaundryOpNormalDeliveryTime.dart';
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
  late LaundryInfoController laundryInfoController;

  Rxn<Laundry> laundry = Rxn();
  Rxn<num> avgDays = Rxn();
  RxBool btnClicked = RxBool(false);
  String? laundryId;

  StreamSubscription? laundryListener;

  @override
  void initState() {
    // laundry = laundryInfoController.getLaundry(laundryOpAuthController.laundryId!).;
    // avgDays.value = laundry.value!.averageNumberOfDays;
    laundryId = Get.parameters["laundryId"];
    if (laundryId != null) {
      Get.put(LaundryInfoController(), permanent: false);
      laundryInfoController = Get.find<LaundryInfoController>();

      laundryListener =
          laundryInfoController.getLaundry(laundryId!).listen((Laundry? event) {
        if (event != null) {
          laundry.value = event;
          avgDays.value = event.averageNumberOfDays;
        } else {
          Get.back();
        }
      });
    } else {
      Get.back();
    }

    super.initState();
  }

  @override
  void dispose() {
    Get.delete<LaundryInfoController>();
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
      bottomNavigationBar: _footerSaveButton(),
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
                      )
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
      if (avgDays.value != null &&
          avgDays != laundry.value!.averageNumberOfDays) {
        return InkWell(
          onTap: () {
            if (avgDays.value != null) {
              btnClicked.value = true;
              laundryInfoController
                  .setAverageNumberOfDays(
                      laundryId: laundryId!,
                      averageNumberOfDays: avgDays.value!)
                  .whenComplete(() => btnClicked.value = false);
            }
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
                  Get.toNamed(getCategoryRoute(laundryId: laundryId!));
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

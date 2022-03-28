import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]
["SavedLocations"]["components"]["SavedLocationComponent"];

class SavedLocationComponent extends StatelessWidget {
  SavedLocationComponent({required this.savelocation, Key? key})
      : super(key: key);
  final SavedLocation savelocation;

  // final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    CustomerAuthController _customerAuthController =
        Get.find<CustomerAuthController>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      height: Get.width * 0.3,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              //================location name=================
              Container(
                child: Text(
                  "${savelocation.name}",
                  style: txt.headline1!
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 12),
                ),
              ),
              Spacer(),
              //===============address================
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Color.fromRGBO(172, 89, 252, 1),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: Get.width * 0.8,
                      child: Text(
                        "${savelocation.location?.address}",
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: txt.subtitle2!.copyWith(
                            color: Color.fromRGBO(33, 33, 33, 1),
                            fontSize: 13.44,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              //================== divider================
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 1.2,
                width: Get.width,
                color: Color.fromRGBO(237, 237, 237, 1),
              ),
              Spacer(),
              Container(
                  child: Row(
                children: [
                  Expanded(
                    child: IconSavedLocationButton(
                      iCon: Icon(
                        Icons.history_edu_outlined,
                        size: 14,
                        color: Colors.white,
                      ),
                      iconColor: Colors.black,
                      title:
                          "${_i18n()["editLocation"]}",
                      ontap: () {
                        mezDbgPrint("edit saved lovation item");
                        Get.toNamed(kPickLocationEditRoute,
                            parameters: {"id": savelocation.id!});
                      },
                    ),
                  ),
                  Expanded(
                    child: IconSavedLocationButton(
                      iCon: Icon(
                        Icons.delete_outline,
                        size: 14,
                        color: Colors.white,
                      ),
                      iconColor: Colors.red,
                      title:
                          "${_i18n()["deleteLocation"]}",
                      ontap: () {
                        mezDbgPrint("delete saved location item");
                        _customerAuthController.deleteLocation(savelocation);
                      },
                    ),
                  )
                ],
              )),
              Spacer()
            ],
          ))
        ],
      ),
    );
  }
}

class IconSavedLocationButton extends StatelessWidget {
  const IconSavedLocationButton(
      {required this.iCon,
      required this.ontap,
      required this.title,
      required this.iconColor,
      Key? key})
      : super(key: key);
  final Widget iCon;
  final String title;
  final Color iconColor;
  final GestureTapCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        width: Get.width,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
        ),
        child: Row(
          children: [
            Container(
                alignment: Alignment.center,
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: iconColor, borderRadius: BorderRadius.circular(25)),
                child: iCon),
            SizedBox(
              width: 5,
            ),
            Container(
              //width: Get.width * 0.25,
              child: Text(
                "$title",
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
      onTap: ontap,
    );
  }
}

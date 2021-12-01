import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/router.dart';

class SavedLocationComponent extends StatelessWidget {
  SavedLocationComponent(
      {required this.savelocation, required this.onPress, Key? key})
      : super(key: key);
  final SavedLocation savelocation;

  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    CustomerAuthController _customerAuthController =
        Get.find<CustomerAuthController>();
    return InkWell(
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: const Color(0xffececec), width: 0.5),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              child:
                  //  MGoogleMap(
                  //     notifyParent: (_, __) {},
                  //     markers: [],
                  //     initialLocation: location),
                  Image.asset(
                "assets/images/adressImage.jpg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("${savelocation.name}",
                          style: const TextStyle(
                              color: const Color(0xff000f1c),
                              fontFamily: "psb",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text("${savelocation.location.address}",
                          style: const TextStyle(
                              color: const Color(0xff000f1c),
                              fontFamily: "psr",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          softWrap: true,
                          textAlign: TextAlign.left),
                    )
                  ],
                ),
              ),
            ),
            IconSavedLocationButton(
              iCon: Container(
                  child: Icon(
                Icons.edit_outlined,
                size: 13,
                color: Color(0xffa8a8a8),
              )),
              ontap: () {
                Get.toNamed(kPickLocationEditRoute,
                    parameters: {"id": savelocation.id!});
              },
            ),
            SizedBox(
              width: 5,
            ),
            IconSavedLocationButton(
              iCon: Container(
                  child: Icon(
                Icons.delete_outline,
                size: 13,
                color: Color(0xffa8a8a8),
              )),
              ontap: () {
                _customerAuthController.deleteLocation(savelocation);
              },
            )
          ],
        ),
      ),
      onTap: onPress,
    );
  }
}

class IconSavedLocationButton extends StatelessWidget {
  const IconSavedLocationButton(
      {required this.iCon, required this.ontap, Key? key})
      : super(key: key);
  final Widget iCon;
  final GestureTapCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          boxShadow: [
            BoxShadow(
                color: const Color(0x33c5c5c5),
                offset: Offset(0, 10),
                blurRadius: 10,
                spreadRadius: 0)
          ],
          color: const Color(0xffffffff),
        ),
        child: iCon,
      ),
      onTap: ontap,
    );
  }
}

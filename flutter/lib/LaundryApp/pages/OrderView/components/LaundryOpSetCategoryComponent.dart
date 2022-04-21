import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:sizer/sizer.dart';

class LaundyOpSetCategoryComponent extends StatelessWidget {
  const LaundyOpSetCategoryComponent({Key? key, required this.order})
      : super(key: key);
  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: handleClick(context: context),
        style: TextButton.styleFrom(
            backgroundColor: !order.isAtLaundry() ? Colors.grey : keyAppColor),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: Text("Set new items weight"),
        ));
  }

  Function()? handleClick({required BuildContext context}) {
    if (!order.isAtLaundry()) {
      return assignNewCategory(context);
    } else {}
    return null;
  }

  Function()? assignNewCategory(context) {
    return () {
      showModalBottomSheet(
          isDismissible: false,
          isScrollControlled: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(8),
                      child: Text(
                        "New items weight",
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                  Divider(),
                  Text("Items category"),
                  // Category selector
                  //
                  Text("Items weight"),
                  TextFormField(
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 12.sp),
                    decoration: InputDecoration(
                        //  contentPadding: EdgeInsets.zero,
                        // label: Text("Items weight"),
                        suffixText: "KG",
                        //  isDense: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        alignLabelWithHint: false,
                        fillColor: Colors.white,
                        filled: true),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8),
                        child: Text("Save items weight"),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.red),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8),
                        child: Text("Cancel"),
                      )),
                ],
              ),
            );
          });
    };
  }
}

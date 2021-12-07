import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  Widget? myLeading;
  GestureTapCallback? onLeadingTaped;
  bool? center;
  Color? color;
  bool autoBack;
  CustomerAppBar(
      {Key? key,
      this.title,
      this.color,
      required this.autoBack,
      this.myLeading,
      this.onLeadingTaped,
      this.center})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  // getting user image;
  String? userImage = Get.find<AuthController>().fireAuthUser!.photoURL;
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      centerTitle: center,
      automaticallyImplyLeading: autoBack,
      leading: myLeading != null
          ? InkWell(
              child: myLeading,
              onTap: onLeadingTaped != null ? onLeadingTaped : null)
          : null,
      title: (title != null)
          ? Text(
              title!,
              style: Theme.of(context).textTheme.headline2,
            )
          : Container(
              width: Get.width * 0.5,
              child: FittedBox(
                child: Row(
                  children: [MezcalmosSharedWidgets.fillTitle(1)],
                ),
              ),
            ),
      actions: [
        PopupMenuButton(
          padding: EdgeInsets.all(8),
          iconSize: 50,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          icon: CircleAvatar(
            backgroundImage: NetworkImage(userImage!),
          ),
          itemBuilder: (context) {
            return ['Notifications', 'Orders'].map((item) {
              return PopupMenuItem(
                value: item,
                child: Row(
                  children: [
                    (item == 'Notifications')
                        ? Icon(
                            Icons.notifications_outlined,
                            size: 18,
                            color: Colors.black,
                          )
                        : Icon(Icons.timelapse_outlined,
                            size: 18, color: Colors.black),
                    Text(' ' + item),
                  ],
                ),
              );
            }).toList();
          },
          onSelected: (item) {},
        ),
      ],
      elevation: 0.1,
    );
  }
}

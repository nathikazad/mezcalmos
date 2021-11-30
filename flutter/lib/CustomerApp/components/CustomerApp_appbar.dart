import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';

// ignore: must_be_immutable
class CustomerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  Widget? myLeading;
  bool? center;
  Color? color;
  bool autoBack;
  CustomerAppBar(
      {Key? key,
      required this.title,
      this.color,
      required this.autoBack,
      this.myLeading,
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
      leading: myLeading,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline2,
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

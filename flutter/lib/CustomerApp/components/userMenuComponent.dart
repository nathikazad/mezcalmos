import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';

class UserMenu extends StatelessWidget {
  UserMenu({
    Key? key,
  }) : super(key: key);

  String? userImage = Get.find<AuthController>().fireAuthUser!.photoURL;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.all(8),
      iconSize: 50,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      icon: CircleAvatar(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(userImage!),
          ),
        ),
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
      onSelected: (item) {
        switch (item) {
          case "Orders":
            Get.toNamed(kOrdersRoute);
            break;
          default:
        }
      },
    );
  }
}

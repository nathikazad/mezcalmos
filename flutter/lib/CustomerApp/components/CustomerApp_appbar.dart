import 'package:flutter/material.dart';

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
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1552058544-f2b08422138a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=699&q=80'),
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

import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';

AppBar customerAppBar(AppBarLeftButtonType leftBtnType,
    {bool withCart = false, bool empty = false}) {
  return mezcalmosAppBar(leftBtnType,
      actionIcons: [!empty ? getIcons(withCart) : Container()]);
}

Widget getIcons(bool withCart) {
  MyPopupMenuController _popUpController = MyPopupMenuController();
  _popUpController.hideMenu();
  return Obx(() {
    if (Get.find<FBNotificationsController>().notifications.value.length > 0 &&
        withCart &&
        Get.find<RestaurantController>().cart.value.items.length > 0) {
      return Row(
        children: [
          ActionIconsComponents.orderIcon(
              Get.find<OrderController>().currentOrders.value.length > 0
                  ? true
                  : false),
          PoPUpMenuComponent(
            controller: _popUpController,
            urlImg: "${Get.find<AuthController>().user!.image}",
            children: [
              InkWell(
                onTap: () {
                  _popUpController.hideMenu();
                },
                child: ActionIconsComponents.notificationIcon(
                    true, EdgeInsets.symmetric(horizontal: 5), () {
                  _popUpController.hideMenu();
                }, ButtonColorType.ButtonDarkColor),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  _popUpController.hideMenu();
                },
                child: ActionIconsComponents.cartIcon(
                    EdgeInsets.symmetric(horizontal: 5), () {
                  _popUpController.hideMenu();
                }, ButtonColorType.ButtonDarkColor),
              )
            ],
          )
        ],
      );
    } else {
      return Row(
        children: [
          Get.find<FBNotificationsController>().notifications.value.length > 0
              ? ActionIconsComponents.notificationIcon(true)
              : SizedBox(),
          ActionIconsComponents.orderIcon(
              Get.find<OrderController>().currentOrders.value.length > 0
                  ? true
                  : false),
          withCart &&
                  Get.find<RestaurantController>().cart.value.items.length >
                      0
              ? ActionIconsComponents.cartIcon(EdgeInsets.only(right: 0))
              : Container()
        ],
      );
    }
  });
}

class PoPUpMenuComponent extends StatefulWidget {
  final List<Widget> children;
  final String urlImg;
  final MyPopupMenuController controller;
  PoPUpMenuComponent(
      {required this.children,
      required this.urlImg,
      required this.controller,
      Key? key})
      : super(key: key);

  @override
  _PoPUpMenuComponentState createState() => _PoPUpMenuComponentState();
}

class _PoPUpMenuComponentState extends State<PoPUpMenuComponent> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.controller.hideMenu();
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: MyPopupMenu(
        controller: widget.controller,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: Image.network(
              "${widget.urlImg}",
              fit: BoxFit.cover,
            ),
          ),
        ),
        menuBuilder: (context) => ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
              color: Colors.transparent,
              child: IntrinsicWidth(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: widget.children),
              )),
        ),
        pressType: PressType.singleClick,
      ),
      onTap: () {},
    );
  }
}

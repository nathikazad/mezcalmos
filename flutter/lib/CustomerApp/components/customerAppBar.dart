import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantCartController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';

AppBar customerAppBar(
    AppBarLeftButtonType leftBtnType, MyPopupMenuController _popUpController,
    {bool withCart = false, bool empty = false}) {
  return mezcalmosAppBar(leftBtnType, actionIcons: [
    !empty ? getIcons(withCart, _popUpController) : Container()
  ]);
}

Widget getIcons(bool withCart, _popUpController) {
  return Obx(() {
    _popUpController.hideMenu();

    if (Get.find<FBNotificationsController>().notifications.value.length > 0 &&
        withCart &&
        Get.find<RestaurantCartController>().cart.value.items.length > 0) {
      return Row(
        children: [
          ActionIconsComponents.notificationIcon(
              hasNewNotif: true,
              margin: EdgeInsets.symmetric(horizontal: 5),
              function: () {
                _popUpController.hideMenu();
              },
              btnTypeColor: ButtonColorType.ButtonDarkColor),
          PoPUpMenuComponent(
            controller: _popUpController,
            urlImg: "${Get.find<AuthController>().user!.image}",
            children: [
              InkWell(
                onTap: () {
                  _popUpController.hideMenu();
                },
                child: ActionIconsComponents.orderIcon(
                    hasInprossesOrders:
                        Get.find<OrderController>().currentOrders.value.length >
                                0
                            ? true
                            : false,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    function: () {
                      _popUpController.hideMenu();
                    },
                    btnTypeColor: ButtonColorType.ButtonDarkColor),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  _popUpController.hideMenu();
                },
                child: ActionIconsComponents.cartIcon(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    function: () {
                      _popUpController.hideMenu();
                    },
                    btnTypeColor: ButtonColorType.ButtonDarkColor),
              )
            ],
          )
        ],
      );
    } else {
      _popUpController.hideMenu();
      return Row(
        children: [
          Get.find<FBNotificationsController>().notifications.value.length > 0
              ? ActionIconsComponents.notificationIcon(
                  hasNewNotif: true, margin: EdgeInsets.all(0))
              : SizedBox(),
          ActionIconsComponents.orderIcon(
              hasInprossesOrders:
                  Get.find<OrderController>().currentOrders.value.length > 0
                      ? true
                      : false,
              margin: EdgeInsets.only(left: 5, right: 0)),
          withCart &&
                  Get.find<RestaurantCartController>().cart.value.items.length >
                      0
              ? ActionIconsComponents.cartIcon(
                  margin: EdgeInsets.only(right: 0, left: 5))
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
    // widget.controller.dispose();
    mezDbgPrint("this one has been disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

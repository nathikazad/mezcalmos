import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mez_services_web_app/routes/authRoutes.dart';
import 'package:mez_services_web_app/services/values/constants.dart';
import 'package:mez_services_web_app/services/widgets/mezCalmosResizer.dart';
import 'package:qlevar_router/qlevar_router.dart';

enum WebAppBarType { Normal, WithActionButtons }

var x = WebAppBarType.Normal;

class WebAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  WebAppBarComponent({Key? key, this.type = WebAppBarType.WithActionButtons})
      : super(key: key);

  WebAppBarType? type;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: kToolbarHeight,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context)),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Image.asset(
                  logo,
                  height: 30,
                  width: 30,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  width: 5,
                ),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                      //fontFamily: 'psr',
                      color: Colors.black,
                      fontSize: 25,
                    )),
                    children: <TextSpan>[
                      TextSpan(
                        text: "MEZ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "CALMOS",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 103, 122, 253),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                if (type == WebAppBarType.WithActionButtons)
                  ...actionWidgetsBuilder()
              ],
            ),
          ],
        ),
      );
    });
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(Get.width, kToolbarHeight);
}

List<Widget> actionWidgetsBuilder() {
  TextStyle txt = GoogleFonts.montserrat(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Color.fromRGBO(103, 121, 254, 1));
  return [
    ActionButton(
      func: () {
        print("this is a test 1");
      },
      titleWidget: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart, color: Colors.white, size: 20),
          SizedBox(
            width: 5,
          ),
          Text(
            "Cart",
            style: txt.copyWith(color: Colors.white),
          ),
        ],
      ),
      bgColor: Color.fromRGBO(103, 121, 254, 1),
    ),
    ActionButton(
      func: () {
        QR.toName(AuthRoutes.signInScreen);
      },
      titleWidget: Text(
        "Log in",
        style: txt,
      ),
      bgColor: Color.fromRGBO(225, 228, 255, 1),
    ),
  ];
}

class ActionButton extends StatelessWidget {
  ActionButton(
      {Key? key, required this.titleWidget, this.bgColor, required this.func})
      : super(key: key);
  final Widget titleWidget;
  final Function func;
  Color? bgColor = Color.fromRGBO(103, 121, 254, 1);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        func.call();
      },
      child: Container(
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: bgColor!),
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
        child: Center(child: titleWidget),
      ),
    );
  }
}

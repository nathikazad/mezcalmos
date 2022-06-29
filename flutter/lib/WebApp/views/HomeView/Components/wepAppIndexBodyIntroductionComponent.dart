import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../services/widgets/mezCalmosResizer.dart';

class WepAppIndexBodyIntroductionComponent extends StatelessWidget {
  const WepAppIndexBodyIntroductionComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    return Padding(
        //padding
        padding: EdgeInsets.only(
            left: MezCalmosResizer.getWepPageHorizontalPadding(context),
            top: getVerticalPadding(context)),
        child: MezCalmosResizer.isMobile(context)
            ? buildWidgetForMobile(context)
            : buildWidgetForTabletAndDesktop(context));
  }

  Widget buildWidgetForMobile(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 30.sp,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: (size.width * 0.5) - 35,
                  child: Image.asset("assets/images/webApp/mobileUI.png"),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: (size.width * 0.5) - 35,
              child: Image.asset("assets/images/webApp/mobileUI1.png"),
            ),
          ],
        ),
        firstText(context),
        SizedBox(
          height: 10,
        ),
        secondText(context),
        Padding(
            padding: EdgeInsets.symmetric(
                // horizontal:
                //     MezCalmosResizer.getWepPageHorizontalPadding(context),
                vertical: 25),
            child: getAppBtn(context)),
      ],
    );
  }

  Widget firstText(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        "Built for all your\ntransportatin\nneeds",
        style: txt.headline1!.copyWith(
            fontWeight: FontWeight.w700,
            fontFamily: "Montserrat",
            height: 1.3,
            fontSize: getSizeForFirstText(context),
            color: Colors.black),
      ),
    );
  }

  Widget secondText(BuildContext context) {
    final txt = Theme.of(context).textTheme;

    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        "Your one stop place to find all your needed local services \nand where you can enjoy fast and high quality services.",
        textAlign: TextAlign.left,
        style: txt.bodyText1!.copyWith(
            color: Colors.black,
            fontSize: getSizeForSecondText(context),
            fontWeight: FontWeight.w300,
            fontFamily: "Nunito"),
      ),
    );
  }

  Widget getAppBtn(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
      width: getSizeForGetAppBtn(context) * 13.5,
      height: getSizeForGetAppBtn(context) * 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(279),
        ),
        gradient: LinearGradient(
            begin: Alignment(1, 0.5),
            end: Alignment(-0.75, 0.75),
            colors: [
              Color.fromRGBO(172, 89, 252, 1),
              Color.fromRGBO(103, 121, 254, 1)
            ]),
      ),
      child: Center(
          child: Text(
        "Get the app",
        style: txt.bodyText1!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: getSizeForGetAppBtn(context),
            fontFamily: "Montserrat"),
      )),
    );
  }

  Widget buildWidgetForTabletAndDesktop(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //first container
        Container(
          width: size.width * 0.53,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              firstText(context),
              SizedBox(
                height: 10,
              ),
              secondText(context),
              SizedBox(
                height: 25,
              ),
              getAppBtn(context)
            ],
          ),
        ),
        //second container
        Container(
          width: size.width * 0.3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 130.sp,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 30.sp,
                              child: Container(
                                height: 100.sp,
                                child: Image.asset(
                                    "assets/images/webApp/mobileUI.png"),
                              ),
                            ),
                            Positioned(
                              bottom: 5.sp,
                              left: -5.sp,
                              child: Container(
                                height: 100.sp,
                                child: Image.asset(
                                    "assets/images/webApp/mobileUI1.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  double getSizeForFirstText(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 16.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 17.sp;
    } else {
      return 30.sp;
    }
  }

  double getSizeForGetAppBtn(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 5.5.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 6.sp;
    } else {
      return 10.sp;
    }
  }

  double getSizeForSecondText(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 5.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 5.5.sp;
    } else {
      return 10.sp;
    }
  }

  double getVerticalPadding(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 20;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 20;
    } else {
      return 11.sp;
    }
  }
}

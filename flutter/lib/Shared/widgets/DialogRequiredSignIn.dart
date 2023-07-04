import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewItemScreen"]["components"]["DialogRequiredSignIn"];
void dialogRequiredSignIn() {
  // Get.dialog<void>(
  showDialog(
    context: QR.context!,
    builder: (BuildContext context) => Material(
      child: Container(
        color: Colors.white,
        // padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                // margin: const EdgeInsets.only(top: 25),
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    MezRouter.back();
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Text(
                      "${_i18n()["title"]}",
                      textAlign: TextAlign.center,
                      style: context.txt.displaySmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Image.asset(
                    "assets/images/shared/loginPopUp.png",
                    fit: BoxFit.contain,
                    height: 50.h,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 15),
                  MezButton(
                    onClick: () async {
                      // to remove the SignIn popUp first!
                      Navigator.pop(context);
                      // then head to kSignInRoute.

                      // ignore: unawaited_futures
                      SignInView.navigateAtOrderTime();
                    },
                    label: "${_i18n()["signBtn"]}",
                    withGradient: true,
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      MezRouter.back();
                    },
                    child: Ink(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          "${_i18n()["notNowBtn"]}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    useSafeArea: false,
  );
}

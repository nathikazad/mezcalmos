import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/UserProfileController.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/UserProfileScreen.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/UserProfileWidgets.dart';
import 'package:mezcalmos/WebApp/screens/authScreen/components/MezButtonWidget.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

class UserProfileForDesktop extends StatefulWidget {
  final FirbaseAuthController authController =
      Get.find<FirbaseAuthController>();
  // this is just to controll incase we want to make a push to this route with a pre-defined mode.
  final UserProfileMode pageInitMode;
  // UserProfileController
  final UserProfileController userProfileController = UserProfileController();
  late final UserProfileWidgetsClass userProfileWidgets;

  UserProfileForDesktop({Key? key, this.pageInitMode = UserProfileMode.Show})
      : super(key: key) {
    userProfileController.setUserProfileMode(pageInitMode);
    userProfileWidgets =
        UserProfileWidgetsClass(userProfileController: userProfileController);
  }

  @override
  State<UserProfileForDesktop> createState() => _UserProfileForDesktopState();
}

class _UserProfileForDesktopState extends State<UserProfileForDesktop>
    with TickerProviderStateMixin {
  FirbaseAuthController _authController = Get.find<FirbaseAuthController>();
  RxBool isUploadingImg = false.obs;
  RxBool clickedSave = false.obs;
  late AnimationController animationController;

  @override
  void initState() {
    widget.userProfileController.initSetup();
    animationController =
        AnimationController(duration: new Duration(seconds: 2), vsync: this);
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    widget.userProfileController.disposeController();
    animationController.dispose();
    super.dispose();
  }

  final TextEditingController nameController = TextEditingController();
  Widget _buildWidgetForAddPhoto() {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(150),
        color: Color.fromRGBO(237, 237, 237, 1),
      ),
      child: Center(
        child: Icon(
          Icons.photo_camera,
          color: Color.fromRGBO(120, 120, 120, 1),
          size: 11.sp,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 600,
        child: UserProfile(
          isWebVersion: true,
        ),
      ),
    );
    var t = Scaffold(
      body: Container(
        height: Get.height - kToolbarHeight * 3,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: _buildWidgetForAddPhoto(),
              onTap: () {
                mezDbgPrint("hh");
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    // title: const Text('AlertDialog Title'),
                    content: Container(
                      width: 100.sp,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MezButton(
                            backColor: Colors.white,
                            content: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Upload photo",
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            onPress: () {
                              Navigator.pop(context, 'Ok');
                            },
                          ),
                          Divider(),
                          MezButton(
                            backColor: Colors.white,
                            content: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Cancel",
                                style: GoogleFonts.montserrat(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            onPress: () {
                              Navigator.pop(context, 'Cancel');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Text(
                "Upload profile image",
                style: GoogleFonts.montserrat(
                    fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            Visibility(
                visible: false,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          "Anna Rodrigo",
                          style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 24),
                        ),
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 8,
            ),
            Container(
              child: Text(
                "Membre since 12/04/2022",
                style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(33, 33, 33, 0.5)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 130.sp,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color.fromRGBO(237, 237, 237, 0.6)),
              child: Theme(
                  data: ThemeData(),
                  child: TextField(
                    controller: nameController,
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                        hintText: "Enter your full name",
                        hintStyle: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: Color.fromRGBO(196, 196, 196, 1),
                            fontWeight: FontWeight.w500),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none),
                  )),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              width: 130.sp,
              height: getHeightOfButton(context) * 1.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(
                    colors: <Color>[
                      Color.fromRGBO(103, 121, 254, 1),
                      Color.fromRGBO(172, 89, 252, 1),
                    ],
                  )),
              child: MezButton(
                btnMargin: const EdgeInsets.all(0),
                backColor: Colors.transparent,
                borderColor: Colors.transparent,
                content: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
                onPress: () {
                  mezDbgPrint("hhh this is save btn");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

double getHeightOfButton(BuildContext context) {
  if (MezCalmosResizer.isDesktop(context)) {
    return 8.sp;
  } else {
    return 11.sp;
  }
}

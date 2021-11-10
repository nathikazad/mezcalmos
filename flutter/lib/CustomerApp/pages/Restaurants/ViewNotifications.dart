import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';

class ViewNotifications extends StatelessWidget {
  ViewNotifications({Key? key}) : super(key: key);

  LanguageController lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
        "back",
        () => Get.back(),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              width: Get.width,
              child: Text(lang.strings['shared']['notification']['title'],
                  style: GoogleFonts.dmSans(
                    textStyle: TextStyle(
                        color: const Color(0xfd1d1d1d),
                        fontWeight: FontWeight.w500,
                        fontFamily: "ProductSans",
                        fontStyle: FontStyle.normal,
                        fontSize: 40.0),
                  ),
                  textAlign: TextAlign.left),
            ),
            SizedBox(
              height: Get.height * 0.015,
            ),
            Expanded(
                child: Container(
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(lang.strings['shared']['notification']['today'],
                        style: const TextStyle(
                            color: const Color(0xff000f1c),
                            fontWeight: FontWeight.w700,
                            fontFamily: "ProductSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0),
                        textAlign: TextAlign.left),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: Get.width,
                    height: 63,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border: Border.all(
                          color: const Color(0xffececec), width: 0.5),
                      color: const Color(0xffffffff),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 31,
                          width: 31,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      child: Text(
                                          "Preparing your Order jf dfhjfdhj hdfjgfhd djdgfhj dbsjdfhgj ",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: const Color(0xff000f1c),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "ProductSans",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 13.0),
                                          textAlign: TextAlign.left),
                                    )),
                                    Container(
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.query_builder,
                                              size: 12,
                                              color: Color(0xff000f1c),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "4:50 PM",
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff000f1c),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "ProductSans",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10.0),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                  "Sylvia’s is preparing your order ghfgh dfjgdfh fbjdfj fbjdfj dbfjbdj dfdbjd",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: const Color(0xff000f1c),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "ProductSans",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  textAlign: TextAlign.left)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: Get.width,
                    height: 63,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border: Border.all(
                          color: const Color(0xffececec), width: 0.5),
                      color: const Color(0xffffffff),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 31,
                          width: 31,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      child: Text(
                                          "Preparing your Order jf dfhjfdhj hdfjgfhd djdgfhj dbsjdfhgj ",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: const Color(0xff000f1c),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "ProductSans",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 13.0),
                                          textAlign: TextAlign.left),
                                    )),
                                    Container(
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.query_builder,
                                              size: 12,
                                              color: Color(0xff000f1c),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "4:50 PM",
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff000f1c),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "ProductSans",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10.0),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                  "Sylvia’s is preparing your order ghfgh dfjgdfh fbjdfj fbjdfj dbfjbdj dfdbjd",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: const Color(0xff000f1c),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "ProductSans",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  textAlign: TextAlign.left)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: Get.width,
                    height: 63,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border: Border.all(
                          color: const Color(0xffececec), width: 0.5),
                      color: const Color(0xffffffff),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 31,
                          width: 31,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      child: Text(
                                          "Preparing your Order jf dfhjfdhj hdfjgfhd djdgfhj dbsjdfhgj ",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: const Color(0xff000f1c),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "ProductSans",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 13.0),
                                          textAlign: TextAlign.left),
                                    )),
                                    Container(
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.query_builder,
                                              size: 12,
                                              color: Color(0xff000f1c),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "4:50 PM",
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff000f1c),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "ProductSans",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10.0),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                  "Sylvia’s is preparing your order ghfgh dfjgdfh fbjdfj fbjdfj dbfjbdj dfdbjd",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: const Color(0xff000f1c),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "ProductSans",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  textAlign: TextAlign.left)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: Get.width,
                    height: 63,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border: Border.all(
                          color: const Color(0xffececec), width: 0.5),
                      color: const Color(0xffffffff),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 31,
                          width: 31,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      child: Text(
                                          "Preparing your Order jf dfhjfdhj hdfjgfhd djdgfhj dbsjdfhgj ",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: const Color(0xff000f1c),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "ProductSans",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 13.0),
                                          textAlign: TextAlign.left),
                                    )),
                                    Container(
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.query_builder,
                                              size: 12,
                                              color: Color(0xff000f1c),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "4:50 PM",
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff000f1c),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "ProductSans",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10.0),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                  "Sylvia’s is preparing your order ghfgh dfjgdfh fbjdfj fbjdfj dbfjbdj dfdbjd",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: const Color(0xff000f1c),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "ProductSans",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  textAlign: TextAlign.left)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 12,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text("3.23.2021",
                            style: const TextStyle(
                                color: const Color(0xff000f1c),
                                fontWeight: FontWeight.w700,
                                fontFamily: "ProductSans",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0),
                            textAlign: TextAlign.left),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: Get.width,
                    height: 63,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border: Border.all(
                          color: const Color(0xffececec), width: 0.5),
                      color: const Color(0xffffffff),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 31,
                          width: 31,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      child: Text(
                                          "Preparing your Order jf dfhjfdhj hdfjgfhd djdgfhj dbsjdfhgj ",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: const Color(0xff000f1c),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "ProductSans",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 13.0),
                                          textAlign: TextAlign.left),
                                    )),
                                    Container(
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.query_builder,
                                              size: 12,
                                              color: Color(0xff000f1c),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "4:50 PM",
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff000f1c),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "ProductSans",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10.0),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                  "Sylvia’s is preparing your order ghfgh dfjgdfh fbjdfj fbjdfj dbfjbdj dfdbjd",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: const Color(0xff000f1c),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "ProductSans",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  textAlign: TextAlign.left)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/controllers/mezAdminAuthController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:sizer/sizer.dart';

class ServiceProfileScreen extends StatefulWidget {
  const ServiceProfileScreen({super.key});

  @override
  State<ServiceProfileScreen> createState() => _ServiceProfileScreenState();
}

class _ServiceProfileScreenState extends State<ServiceProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: _drawerHeader()),
            Text(
              'Settings',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 6),
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Info',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Divider(
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.support_agent,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Operators',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            // shortcuts
            SizedBox(height: 25),
            Text(
              'Shortcuts',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 6),
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.privacy_tip,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Privacy policy',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Divider(
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Log Out',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.red),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _drawerHeader() {
    return Container(
      padding: EdgeInsets.only(left: 21, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              height: 136,
              width: 136,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: secondaryLightBlueColor,
                // border: Border.all(color: Colors.black),
              )
              // child: ClipOval(
              // clipBehavior: Clip.antiAlias,
              // child: Get.find<MezAdminAuthController>().admin?.img == null
              //     ? Icon(
              //         Icons.person,
              //         size: 70,
              //         color: primaryBlueColor,
              //       )
              //       : CachedNetworkImage(
              //           imageUrl:
              //            Get.find<MezAdminAuthController>()
              //               .deliveryOperator!
              //               .companyImg!,
              //           fit: BoxFit.cover,
              //           imageBuilder: (BuildContext context,
              //                   ImageProvider<Object> imageProvider) =>
              //               Container(
              //             width: getSizeRelativeToScreen(300, 100.w, 100.h).sp,
              //             height: getSizeRelativeToScreen(300, 100.w, 100.h).sp,
              //             decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //               image: DecorationImage(
              //                   image: imageProvider, fit: BoxFit.cover),
              //             ),
              //           ),
              //           placeholder: (BuildContext context, String url) =>
              //               Container(
              //             width: getSizeRelativeToScreen(300, 100.w, 100.h).sp,
              //             height: getSizeRelativeToScreen(300, 100.w, 100.h).sp,
              //             child: Center(
              //               child: CircularProgressIndicator(),
              //             ),
              //           ),
              //           errorWidget: (BuildContext context, String url, error) =>
              //               Container(
              //                   width:
              //                       getSizeRelativeToScreen(300, 100.w, 100.h).sp,
              //                   height:
              //                       getSizeRelativeToScreen(300, 100.w, 100.h).sp,
              //                   child: Center(child: Icon(Icons.error))),
              //         ),
              // ),
              ),
          const SizedBox(height: 15),
          Text(
            // Get.find<DeliveryOperatorAuthController>()
            //         .deliveryOperator
            //         ?.companyName ??
            "-",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/TaxiAdminApp/Models/NbOrders.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Driver/DriverPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Orders/OrderViewPage.dart';

const mypadding = const EdgeInsets.symmetric(horizontal: 10);

// this class contains all the components that mezAdimn needs
class MezAdminOrdersComponents {
  static Widget ordersCumOnDayComponent(
      OrdersStates state, String title, String count) {
    LinearGradient? mygradient = null;
    switch (state) {
      case OrdersStates.Finished:
        mygradient = LinearGradient(
            begin: Alignment(0.09354447573423386, 0.5),
            end: Alignment(0.9385244250297546, 0.6013823747634888),
            colors: [const Color(0xff19a535), const Color(0xff0d531b)]);
        break;
      case OrdersStates.Cancelled:
        mygradient = LinearGradient(
            begin: Alignment(0.11480801552534103, 0.5),
            end: Alignment(0.9087746739387512, 0.5),
            colors: [const Color(0xffd91c1c), const Color(0xff6d0e0e)]);
        break;
      case OrdersStates.Expired:
        mygradient = LinearGradient(
            begin: Alignment(0.07909747213125229, 0.5),
            end: Alignment(0.8506692051887512, 0.5),
            colors: [const Color(0xffa1a399), const Color(0xff51524d)]);
        break;
      case OrdersStates.InProccess:
        mygradient = LinearGradient(
            begin: Alignment(0.12472916394472122, 0.5),
            end: Alignment(0.8882563710212708, 0.5),
            colors: [const Color(0xffe29c4b), const Color(0xff714e26)]);
        break;
      case OrdersStates.IsLooking:
        mygradient = LinearGradient(
            begin: Alignment(0.12472916394472122, 0.5),
            end: Alignment(0.8882563710212708, 0.5),
            colors: [const Color(0xa54b57e2), const Color(0xff343ac7)]);
        break;
      default:
    }
    return Container(
      width: Get.width,
      padding: const EdgeInsets.only(left: 10, right: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              gradient: mygradient),
          child: Container(
            padding: mypadding,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text(
                      "$title",
                      textAlign: TextAlign.right,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Colors.white.withOpacity(0.9568627450980393),
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "$count",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9568627450980393),
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// buildWidgets for Orders in table
  static Widget buildTableWidget(
      OrdersStates states,
      String orderId,
      String time,
      String? driverImg,
      String custImg,
      String s,
      String r,
      String o) {
    print(driverImg.toString());
    print(custImg.toString());
    var mytextStyle = TextStyle(
        color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w600);
    LinearGradient? myColors = null;
    switch (states) {
      case OrdersStates.Cancelled:
        myColors = LinearGradient(
            begin: Alignment(0.09354447573423386, 0.5),
            end: Alignment(0.9385244250297546, 0.6013823747634888),
            colors: [const Color(0xbcf82105), const Color(0xa0762007)]);
        break;
      case OrdersStates.Expired:
        myColors = LinearGradient(
            begin: Alignment(0.12271256744861603, 0.5),
            end: Alignment(0.9394280314445496, 0.5),
            colors: [const Color(0xff86887f), const Color(0xac434440)]);
        break;
      case OrdersStates.Finished:
        myColors = LinearGradient(
            begin: Alignment(0.09354447573423386, 0.5),
            end: Alignment(0.9385244250297546, 0.6013823747634888),
            colors: [const Color(0x9119a535), const Color(0xa0167e2b)]);
        break;
      case OrdersStates.InProccess:
        myColors = LinearGradient(
            begin: Alignment(0.1032487004995346, 0.5),
            end: Alignment(0.9385117292404175, 0.5),
            colors: [const Color(0xebf07c09), const Color(0x91785e05)]);
        break;
      case OrdersStates.IsLooking:
        myColors = LinearGradient(
            begin: Alignment(0.1032487004995346, 0.5),
            end: Alignment(0.9385117292404175, 0.5),
            colors: [const Color(0xff444acd), const Color(0xa83d43ca)]);
        break;
      default:
    }
    return Container(
      // color: myColor,
      decoration: BoxDecoration(gradient: myColors),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Text(
                "${time}",
                style: mytextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: (driverImg != "none")
                ? Center(
                    child: Container(
                      height: 30,
                      width: 30,
                      child:
                          ClipOval(child: mLoadImage(url: driverImg)
                              //  Image.network(
                              //   "${driverImg}",
                              //   fit: BoxFit.cover,
                              // ),
                              ),
                    ),
                  )
                : Center(
                    child: Container(
                      height: 30,
                      width: 30,

                      child: ClipOval(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          color: Colors.white,
                          child: Image.asset(
                            "assets/images/logo.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      //add mezcalmos icon
                    ),
                  ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                child: Center(
              child: Container(
                  height: 30,
                  width: 30,
                  child: ClipOval(child: mLoadImage(url: custImg)
                      // Image.network(
                      //   "${custImg}",
                      //   fit: BoxFit.cover,
                      // ),
                      )),
            )),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                "${s}",
                style: mytextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                "${r}",
                style: mytextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                "${o}",
                style: mytextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 16,
                ),
                onPressed: () {
                  print("hello world $orderId");
                  Get.to(() => OrderViewPage("$orderId"));
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  static Widget buildNotificationTable(String uid, int index, String img,
      String name, String t, String s, String r, String o) {
    var myGradient = (index % 2 == 0)
        ? LinearGradient(
            begin: Alignment(0.1032487004995346, 0.5),
            end: Alignment(0.9385117292404175, 0.5),
            colors: [const Color(0xff444acd), const Color(0xa83d43ca)])
        : LinearGradient(
            begin: Alignment(0.1032487004995346, 0.5),
            end: Alignment(0.9385117292404175, 0.5),
            colors: [const Color(0xff7579d0), const Color(0xff444acd)]);

    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(gradient: myGradient),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      height: 35,
                      width: 35,
                      child: ClipOval(
                          child: (img != "null")
                              ? mLoadImage(url: img)
                              // Image.network(
                              //     "${img}",
                              //     fit: BoxFit.cover,
                              //   )
                              : Container(
                                  padding: const EdgeInsets.all(8),
                                  color: Colors.white,
                                  child: Image.asset(
                                    aLogoPath,
                                    height: 25,
                                    width: 25,
                                  ),
                                )),
                    ),
                    Expanded(
                      child: Text(
                        "${name}",
                        style: TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  "${t}",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  "${s}",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  "${r}",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  "${o}",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                  onPressed: () {
                    Get.to(() => (DriverPage(uid)));
                  },
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        print("the user  uid is $uid ${'=' * 8}");
        Get.to(() => (DriverPage(uid)));
      },
    );
  }

  ///orders board view for admin
  static Widget ordersBoardView(
      String? total, String? dropedOff, String? canceled, String? expired) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 15),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(0.9568901658058167, 0.5),
                    end: Alignment(0.11593939363956451, 0.5),
                    colors: [const Color(0xff4f26a2), const Color(0xff7643e0)]),
                borderRadius: BorderRadius.circular(18)),
            child: Text(
              "$total",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            width: 60,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 15),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(0.09354447573423386, 0.5),
                    end: Alignment(0.9385244250297546, 0.6013823747634888),
                    colors: [const Color(0xff19a535), const Color(0xff0d531b)]),
                borderRadius: BorderRadius.circular(18)),
            child: Text(
              "$dropedOff",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            width: 60,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 15),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(0.11480801552534103, 0.5),
                    end: Alignment(0.9087746739387512, 0.5),
                    colors: [const Color(0xffd91c1c), const Color(0xff6d0e0e)]),
                borderRadius: BorderRadius.circular(18)),
            child: Text(
              "$canceled",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            width: 60,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 15),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(0.07909747213125229, 0.5),
                    end: Alignment(0.8506692051887512, 0.5),
                    colors: [const Color(0xffa1a399), const Color(0xff51524d)]),
                borderRadius: BorderRadius.circular(18)),
            child: Text(
              "$expired",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  static Widget noDataImage() {
    return Container(
      child: Image.asset("assets/images/nodata.jpg"),
    );
  }
}

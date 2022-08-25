import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mez_services_web_app/services/values/constants.dart';
import 'package:mez_services_web_app/services/widgets/mezCalmosResizer.dart';

import 'components/installAppBarComponent.dart';

class RestaurantsListView extends StatefulWidget {
  RestaurantsListView({Key? key}) : super(key: key);

  @override
  State<RestaurantsListView> createState() => _RestaurantsListViewState();
}

class _RestaurantsListViewState extends State<RestaurantsListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InstallAppBarComponent(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Restaurants",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  color: Colors.black,
                )),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  _searchInput(context),
                  _sortingSwitcher(context),
                  buildListOFCardsForDesktopAndTablet(context)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _sortingSwitcher(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context)),
      child: SwitchListTile(
        value: true,
        onChanged: (bool v) {
          // viewController.changeAlwaysOpenSwitch(v);
          // viewController.filterRestaurants();
        },
        activeColor: primaryBlueColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        title: Text(
          "Show only open restaurants",
          style: Get.textTheme.bodyText2
              ?.copyWith(fontWeight: FontWeight.w700, fontSize: 14),
        ),
      ),
    );
  }

  Widget _searchInput(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context),
        vertical: 20,
      ),
      child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          style: Get.textTheme.bodyText1!.copyWith(fontSize: 13),
          onChanged: (String value) {
            print("this is a test");
            // viewController.searchQuery.value = value;
            // viewController.filterRestaurants();
            // mezDbgPrint(viewController.searchQuery);
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 8.0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey.shade300,
            ),
            hintStyle: TextStyle(color: Colors.grey.shade300, fontSize: 13),
            hintText: "Search",
          )),
    );
  }

  Widget buildListOFCardsForDesktopAndTablet(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
              offset: Offset(0, 1),
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 4.0,
              spreadRadius: -1),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 300,
            height: 110,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: Image(
                image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2019/12/11/06/36/pizza-dish-4687556_1280.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //title
          Container(
            padding:
                const EdgeInsets.only(top: 10, bottom: 0, right: 10, left: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              "La castita De Danny",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              )),
            ),
          ),
          //subtitle
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              "Tacos",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(73, 73, 73, 1),
              )),
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "\$\$",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(73, 73, 73, 1),
                  )),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.schedule,
                      size: 10,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "52min",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(children: [
                  Icon(
                    Icons.delivery_dining,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "\$50",
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                ]),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(children: [
                  Icon(
                    Icons.credit_card,
                    size: 15,
                  ),
                ]),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildListOFCardsForMobile(BuildContext context) {
    return Container();
  }
}

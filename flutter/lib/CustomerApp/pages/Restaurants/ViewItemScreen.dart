import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/components/appbarComponent.dart';
import 'package:mezcalmos/CustomerApp/components/buttonComponent.dart';
import 'package:mezcalmos/CustomerApp/components/checkBoxComponent.dart';
import 'package:mezcalmos/CustomerApp/components/incrementalComponent.dart';
import 'package:mezcalmos/CustomerApp/components/textFieldComponent.dart';
import 'package:mezcalmos/CustomerApp/components/titlesComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantCartController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/models/restaurant.dart';
import 'package:mezcalmos/CustomerApp/models/cart.dart';
import 'dart:async';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/router.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

enum ViewItemScreenMode { AddItemMode, EditItemMode }

class ViewItemScreen extends GetView<RestaurantsInfoController> {
  ViewItemScreenMode viewItemScreenMode;
  Rxn<CartItem> cartItem = Rxn();
  late RestaurantCartController restaurantCartController;

  ViewItemScreen(this.viewItemScreenMode) {
    Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    restaurantCartController =
        Get.put<RestaurantCartController>(RestaurantCartController());
    if (this.viewItemScreenMode == ViewItemScreenMode.AddItemMode) {
      String restaurantId = Get.parameters['restaurantId']!;
      String itemId = Get.parameters['itemId']!;
      this.controller.getItem(restaurantId, itemId).then((value) {
        this.cartItem.value = CartItem(value, restaurantId);
      });
    } else {
      this.cartItem.value = CartItem.clone(restaurantCartController
          .cart.value!.items
          .firstWhere((item) => item.id == Get.parameters["cartItemId"]));
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("${cartItem.value?.item}");
    return Scaffold(
      // appBar: AppBar(
      //   title: Obx(() => Text("${cartItem.value?.item.name ?? 'Loading'}")),
      //   actions: [
      //     TextButton(
      //         onPressed: () => Get.to(ViewCartScreen()), child: Text("Cart"))
      //   ],
      // ),
      // body: LayoutBuilder(builder:
      //     (BuildContext context, BoxConstraints viewportConstraints) {
      //   return SingleChildScrollView(
      //       child: ConstrainedBox(
      //           constraints: BoxConstraints(
      //             minHeight: viewportConstraints.maxHeight,
      //           ),
      //           child: Obx(() => Column(
      //                 children: [
      //                   if (cartItem.value?.item != null) ...[
      //                     Text(cartItem.value!.item.name!),
      //                     Text(cartItem.value!.item.description!),
      //                     Text(
      //                         "\$${currency.format(cartItem.value!.item.cost)}"),
      //                     image(cartItem.value!.item.image),
      //                     chooseOneCheckBoxes(
      //                         cartItem.value!.item.chooseOneOptions),
      //                     chooseManyCheckBoxes(
      //                         cartItem.value!.item.chooseManyOptions),
      // incrementQuantityButton(),
      //                     Text(
      //                         "\$${currency.format(cartItem.value!.totalCost())}"),
      //                  addItemButton()
      //                   ] else
      //                     Text("Loading")
      //                 ],
      //               ))),
      //               );
      // }),
      body: Obx(
        () => (cartItem.value?.item == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    // alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 80),

                    height: Get.height,
                    width: Get.width,
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Container(
                          height: Get.height * 0.45,
                          width: Get.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25)),
                            child: Image.network(
                              "${cartItem.value!.item.image}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: Get.height * 0.45,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            border: Border.all(
                                color: const Color(0x5c707070), width: 1),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(0, -2),
                                  blurRadius: 6,
                                  spreadRadius: 0)
                            ],
                            gradient: LinearGradient(
                              begin: Alignment(0.5, 0),
                              end: Alignment(0.5, 0.8458111882209778),
                              colors: [
                                const Color(0x00000f1c),
                                const Color(0xad000f1c),
                                const Color(0xff000f1c)
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            top: Get.height * 0.325,
                            child: Container(
                              width: Get.width,
                              child: Text("${cartItem.value?.item.name}",
                                  style: const TextStyle(
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "ProductSans",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 25.0),
                                  textAlign: TextAlign.center),
                            )),
                      ],
                    ),
                  )),
                  Positioned(child: restaurantAppBarComponent("back", () {})),
                  SlidingUpPanel(
                    maxHeight: Get.height * 0.85,
                    minHeight: Get.height * 0.45,
                    parallaxEnabled: true,
                    parallaxOffset: 1,
                    body: Container(
                      decoration: BoxDecoration(
                        color: Color(0x36fafafa),
                      ),
                    ),
                    panelBuilder: (sc) =>
                        _panel(sc, context, cartItem.value!.item),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0)),
                  ),
                ],
              )),
      ),
    );
  }

  Widget _panel(ScrollController sc, BuildContext context, Item item) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              boxShadow: [
                BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, -5),
                    blurRadius: 6,
                    spreadRadius: 0)
              ],
              color: const Color(0xfff6f6f6)),
          child: SingleChildScrollView(
            controller: sc,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0x29000000),
                        offset: Offset(0, 2),
                        blurRadius: 6,
                        spreadRadius: 0)
                  ],
                  color: const Color(0xfff6f6f6),
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  MenuTitles(
                    title: "Description",
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text("${item.description}",
                        style: const TextStyle(
                            color: const Color(0xff000f1c),
                            fontWeight: FontWeight.w400,
                            fontFamily: "ProductSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.left),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  chooseOneCheckBoxes(item.chooseOneOptions),
                  SizedBox(
                    height: 20,
                  ),
                  chooseManyCheckBoxes(item.chooseManyOptions),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    width: Get.width,
                    height: 313,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: const Color.fromRGBO(240, 242, 245, 1),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        MenuTitles(
                          title: "Notes",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFieldComponent(
                          hint: "Write Notes",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text("Quantity",
                                  style: const TextStyle(
                                      color: const Color(0xff000f1c),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "ProductSans",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.0),
                                  textAlign: TextAlign.left),
                              Spacer(),
                              IncrementalComponent(
                                increment: () {
                                  cartItem.value!.quantity++;
                                  cartItem.refresh();
                                },
                                decrement: () {
                                  cartItem.value!.quantity--;
                                  cartItem.refresh();
                                },
                                value: cartItem.value!.quantity,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ButtonComponent(
                            widget: Row(
                              children: [
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      style: GoogleFonts.mulish(
                                        textStyle: TextStyle(
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "FontAwesome5Pro",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 20.0),
                                      ),
                                      text: "+"),
                                  TextSpan(
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "ProductSans",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.0),
                                      ),
                                      text: "  ADD TO CART")
                                ])),
                                Spacer(),
                                Text(
                                    "\$${currency.format(cartItem.value!.totalCost())}",
                                    style: GoogleFonts.mulish(
                                      textStyle: TextStyle(
                                          color: const Color(0xffffffff),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "ProductSans",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.0),
                                    ),
                                    textAlign: TextAlign.center)
                              ],
                            ),
                            function: () {
                              restaurantCartController.addItem(cartItem.value!);
                              Get.back();
                              //   Get.off(ViewCartScreen(),
                              //       duration: Duration(seconds: 1),
                              //       transition: Transition.rightToLeft);
                            })
                      ],
                    ),
                  )
                  // Expanded(child: Container())
                ],
              ),
            ),
          ),
        ));
    // appBar: AppBar(
    //   title: Obx(() => Text("${cartItem.value?.item.name ?? 'Loading'}")),
    //   actions: [
    //     TextButton(
    //         onPressed: () =>
    //             (this.viewItemScreenMode == ViewItemScreenMode.AddItemMode)
    //                 ? Get.toNamed(kCartRoute)
    //                 : Get.back(),
    //         child: Text("Cart"))
    //   ],
    // ),
    // body: LayoutBuilder(builder:
    //     (BuildContext context, BoxConstraints viewportConstraints) {
    //   return SingleChildScrollView(
    //       child: ConstrainedBox(
    //           constraints: BoxConstraints(
    //             minHeight: viewportConstraints.maxHeight,
    //           ),
    //           child: Obx(() => Column(
    //                 children: [
    //                   if (cartItem.value?.item != null) ...[
    //                     Text(cartItem.value!.item.name!),
    //                     Text(cartItem.value!.item.description!),
    //                     Text(
    //                         "\$${currency.format(cartItem.value!.item.cost)}"),
    //                     image(cartItem.value!.item.image),
    //                     chooseOneCheckBoxes(
    //                         cartItem.value!.item.chooseOneOptions),
    //                     chooseManyCheckBoxes(
    //                         cartItem.value!.item.chooseManyOptions),
    //                     incrementQuantityButton(),
    //                     Text(
    //                         "\$${currency.format(cartItem.value!.totalCost())}"),
    //                     (this.viewItemScreenMode ==
    //                             ViewItemScreenMode.AddItemMode)
    //                         ? addItemButton()
    //                       : editItemButton()
    //                   ] else
    //                     Text("Loading")
    //                 ],
    //               ))));
    // }));
  }

  Widget image(String? imageLink) {
    if (imageLink != null)
      return Image.network(imageLink, height: 40);
    else
      return Text("Loading");
  }

  Widget chooseOneCheckBoxes(List<ChooseOneOption> chooseOneOptions) {
    // print(this.itemWithOptions.value?.chosenOneOptions.toString());
    List<Widget> chooseOneWidgetArray = [];
    chooseOneOptions.forEach((chooseOneOption) {
      List<Widget> chooseOneWidgetOptionsArray = [];
      chooseOneOption.chooseOneOptionListItems
          .forEach((chooseOneOptionListItem) {
        String name = chooseOneOptionListItem.name!;
        if (chooseOneOptionListItem.cost > 0) {
          name += " (\$${currency.format(chooseOneOptionListItem.cost)})";
        }
        chooseOneWidgetOptionsArray.add(
          CheckBoxComponent(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            title: name,
            intailVal: cartItem.value!.chosenOneOptions[chooseOneOption.id!] ==
                chooseOneOptionListItem.id,
            onValueChanged: (newValue) {
              cartItem.value!.chosenOneOptions[chooseOneOption.id!] =
                  chooseOneOptionListItem.id!;
              cartItem.refresh();
            },
          ),
          // CheckboxListTile(
          //   title: Text(name),
          //   value: cartItem.value!.chosenOneOptions[chooseOneOption.id!] ==
          //       chooseOneOptionListItem.id,
          //   onChanged: (newValue) {
          //     cartItem.value!.chosenOneOptions[chooseOneOption.id!] =
          //         chooseOneOptionListItem.id!;
          //     cartItem.refresh();
          //   },
          //   controlAffinity:
          //       ListTileControlAffinity.leading, //  <-- leading Checkbox
          // ),
        );
      });
      chooseOneWidgetArray.add(Column(
          children: <Widget>[
                MenuTitles(
                  title: chooseOneOption.name!,
                ),
                SizedBox(
                  height: 5,
                )
              ] +
              chooseOneWidgetOptionsArray));
    });
    return Column(children: chooseOneWidgetArray);
  }

  Widget chooseManyCheckBoxes(List<ChooseManyOption> chooseManyOptions) {
    List<Widget> chooseManyWidgetArray = [
      MenuTitles(
        title: "Optional",
      ),
      SizedBox(
        height: 5,
      )
    ];
    chooseManyOptions.forEach((chooseManyOption) {
      String name = chooseManyOption.name!;
      if (chooseManyOption.cost > 0) {
        name += " (\$${currency.format(chooseManyOption.cost)})";
      }
      chooseManyWidgetArray.add(
        CheckBoxComponent(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          title: name,
          intailVal: cartItem.value!.chosenManyOptions[chooseManyOption.id!],
          onValueChanged: (newValue) {
            cartItem.value!.chosenManyOptions[chooseManyOption.id!] =
                newValue ?? false;
            cartItem.refresh();
          },
        ),
        // CheckboxListTile(
        //   title: Text(name),
        //   value: cartItem.value!.chosenManyOptions[chooseManyOption.id!],
        //   onChanged: (newValue) {
        //     cartItem.value!.chosenManyOptions[chooseManyOption.id!] =
        //         newValue ?? false;
        //     cartItem.refresh();
        //   },
        //   controlAffinity:
        //       ListTileControlAffinity.leading, //  <-- leading Checkbox
        // ),
      );
    });
    return Column(children: chooseManyWidgetArray);
  }

  Widget incrementQuantityButton() {
    return OutlinedButton(
        onPressed: () {
          cartItem.value!.quantity++;
          cartItem.refresh();
        },
        child: Text(cartItem.value!.quantity.toString()));
  }

  Widget addItemButton() {
    return OutlinedButton(
        child: Text("Add item to cart"),
        onPressed: () {
          restaurantCartController.addItem(cartItem.value!);
          Get.off(ViewCartScreen());
        });
  }

  Widget editItemButton() {
    return OutlinedButton(
        child: Text("Edit item"),
        onPressed: () {
          restaurantCartController.addItem(cartItem.value!);
          Get.back();
        });
  }
}

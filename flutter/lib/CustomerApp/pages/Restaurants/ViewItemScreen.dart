import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/CustomerApp/components/buttonComponent.dart';
import 'package:mezcalmos/CustomerApp/components/checkBoxComponent.dart';
import 'package:mezcalmos/CustomerApp/components/incrementalComponent.dart';
import 'package:mezcalmos/CustomerApp/components/textFieldComponent.dart';
import 'package:mezcalmos/CustomerApp/components/titlesComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantCartController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

final currency = new NumberFormat("#,##0.00", "en_US");
var widgetHieght = 20;
enum ViewItemScreenMode { AddItemMode, EditItemMode }

class ViewItemScreen extends StatefulWidget {
  final ViewItemScreenMode? viewItemScreenMode;
  ViewItemScreen(this.viewItemScreenMode);
  @override
  _ViewItemScreenState createState() => _ViewItemScreenState();
}

class _ViewItemScreenState extends State<ViewItemScreen> {
  LanguageController lang = Get.find<LanguageController>();
  TextEditingController textcontoller = TextEditingController();
  Rxn<CartItem> cartItem = Rxn();
  late RestaurantCartController restaurantCartController;
  RestaurantsInfoController controller = Get.find<RestaurantsInfoController>();

  @override
  void initState() {
    mezDbgPrint("Args : ${Get.arguments.toString()}");
    mezDbgPrint("params : ${Get.parameters.toString()}");

    Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    restaurantCartController =
        Get.put<RestaurantCartController>(RestaurantCartController());
    mezDbgPrint("widget.viewItemScreenMode => ${widget.viewItemScreenMode}");
    if (widget.viewItemScreenMode == ViewItemScreenMode.AddItemMode) {
      String? restaurantId = Get.parameters['restaurantId'];
      mezDbgPrint("got rest id param => $restaurantId");
      String? itemId = Get.parameters['itemId'];
      mezDbgPrint("got item id param => $itemId");

      this.controller.getItem(restaurantId!, itemId!).then((value) {
        this.cartItem.value = CartItem(value, restaurantId);
      });
    } else {
      this.cartItem.value = CartItem.clone(
          restaurantCartController.cart.value.items.firstWhere((item) {
        return item.id == Get.parameters["cartItemId"];
      }));
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomInset: true,
      //    resizeToAvoidBottomPadding: false, //
      backgroundColor: const Color(0xffffffff),
      appBar: mezcalmosAppBar("back", () => Get.back(), actionIcons: [
        Obx(() => restaurantCartController.cart.value.items.length > 0
            ? ActionIconsComponents.cartIcon()
            : SizedBox()),
        ActionIconsComponents.notificationIcon(),
        ActionIconsComponents.orderIcon()
      ]),
      body: Obx(() => (cartItem.value?.item == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned(
                            child: Container(
                          margin: const EdgeInsets.only(top: 10),
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
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25)),
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
                                  top: Get.height * 0.34,
                                  child: Container(
                                    width: Get.width,
                                    child: Text(
                                        "${cartItem.value?.item.name![0].toUpperCase()}${cartItem.value?.item.name!.substring(1)}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                        style: TextStyle(
                                            color: const Color(0xffffffff),
                                            // fontWeight: FontWeight.w400,
                                            fontFamily: "psr",
                                            // fontStyle: FontStyle.normal,
                                            fontSize: 25.0.sp),
                                        textAlign: TextAlign.center),
                                  )),
                            ],
                          ),
                        )),
                        SlidingUpPanel(
                          maxHeight: Get.height * 0.87,
                          minHeight: Get.height * 0.40,
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
                    ),
                  ),
                ],
              ),
            )),
    );
  }

  Widget _panel(ScrollController sc, BuildContext context, Item item) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18), topRight: Radius.circular(18)),
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
            //clipBehavior: ,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0x29000000),
                        offset: Offset(0, 2),
                        blurRadius: 6,
                        spreadRadius: 0)
                  ],
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  MenuTitles(
                    title:
                        "${lang.strings['customer']['restaurant']['menu']['description']}",
                  ),

                  SizedBox(
                    height: 15.sp,
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
                    height: 20.sp,
                  ),
                  chooseOneCheckBoxes(item.chooseOneOptions),
                  SizedBox(
                    height: 20.sp,
                  ),
                  chooseManyCheckBoxes(item.chooseManyOptions),
                  SizedBox(
                    height: 10.sp,
                  ),

                  Container(
                    width: Get.width,
                    // height: 313.sp,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: const Color.fromRGBO(240, 242, 245, 1),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.sp,
                        ),
                        MenuTitles(
                          title:
                              "${lang.strings['customer']['restaurant']['menu']['notes']}",
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        TextFieldComponent(
                          textController: textcontoller,
                          hint: lang.strings['customer']['restaurant']['menu']
                              ['notes'],
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                                  "${lang.strings['customer']['restaurant']['menu']['quantity']}",
                                  style: TextStyle(
                                      color: const Color(0xff000f1c),
                                      fontFamily: "psr",
                                      fontSize: 20.sp),
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
                          height: 20.sp,
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
                                            fontFamily: "psb",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 20.0.sp),
                                      ),
                                      text: (ViewItemScreenMode.AddItemMode ==
                                              widget.viewItemScreenMode)
                                          ? "+"
                                          : ""),
                                  TextSpan(
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: const Color(0xffffffff),
                                            fontFamily: "psr",
                                            fontSize: 16.0.sp),
                                      ),
                                      text: ViewItemScreenMode.AddItemMode ==
                                              widget.viewItemScreenMode
                                          ? lang.strings['customer']
                                                  ['restaurant']['menu']
                                              ['addToCart']
                                          : lang.strings['customer']
                                                  ['restaurant']['menu']
                                              ['modifyItem'])
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
                                          fontSize: 16.0.sp),
                                    ),
                                    textAlign: TextAlign.center)
                              ],
                            ),
                            function: () {
                              if (ViewItemScreenMode.AddItemMode ==
                                  widget.viewItemScreenMode) {
                                String _notes = textcontoller.text;
                                cartItem.value!.notes =
                                    _notes.length > 0 ? _notes : "";
                                restaurantCartController
                                    .addItem(cartItem.value!);
                                Get.offNamed(kCartRoute);
                              } else {
                                restaurantCartController
                                    .addItem(cartItem.value!);
                                Get.back();
                              }
                            }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom,
                  ),

                  // Expanded(child: Container())
                ],
              ),
            ),
          ),
        ));
  }

  Widget image(String? imageLink) {
    if (imageLink != null)
      return Image.network(imageLink, height: 40);
    else
      return Center(
        child: CircularProgressIndicator(),
      );
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
    List<Widget> chooseManyWidgetArray = [];
    if (chooseManyOptions.length > 0) {
      chooseManyWidgetArray.add(MenuTitles(
        title: lang.strings['shared']['inputLocation']['optional'],
      ));
      chooseManyWidgetArray.add(SizedBox(
        height: 5,
      ));
    }

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
        child:
            Text(lang.strings['customer']['restaurant']['menu']['addToCart']),
        onPressed: () {
          restaurantCartController.addItem(cartItem.value!);
          Get.off(ViewCartScreen());
        });
  }

  Widget editItemButton() {
    return OutlinedButton(
        child:
            Text(lang.strings['customer']['restaurant']['menu']['modifyItem']),
        onPressed: () {
          restaurantCartController.addItem(cartItem.value!);
          Get.back();
        });
  }
}

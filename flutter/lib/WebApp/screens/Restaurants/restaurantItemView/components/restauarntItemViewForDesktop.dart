import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/DialogRequiredSignIn.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/ButtonStyles.dart';
import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/widgets/IncrementalComponent.dart';
import 'package:mezcalmos/WebApp/controllers/mezWebSideBarController.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/restaurantItemView/components/ItemOptionCard.dart';
import 'package:mezcalmos/WebApp/screens/restaurants/restaurantItemView/components/itemNotesComponentWidget.dart';
import 'package:mezcalmos/WebApp/widgets/WidgetWithBackButton.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/widgets/mezLoaderWidget.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:rive/rive.dart';

import '../../../../../Shared/constants/global.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/restaurantItemView/restaurantItemView.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewRestaurantScreen"];

class RestaurantItemViewForDesktop extends StatefulWidget {
  RestaurantItemViewForDesktop(
      {Key? key,
      required this.cartItem,
      required this.openOrdresDrawer,
      required this.currentRestaurant,
      required this.viewItemScreenMode,
      this.isSpecial = false,
      this.showViewRestaurant = false})
      : super(key: key);
  final Rxn<CartItem> cartItem;
  final Rx<Restaurant?> currentRestaurant;
  final bool? showViewRestaurant;
  final bool? isSpecial;
  final Function openOrdresDrawer;

  final ViewItemScreenMode viewItemScreenMode;

  @override
  State<RestaurantItemViewForDesktop> createState() =>
      _RestaurantItemViewForDesktopState();
}

class _RestaurantItemViewForDesktopState
    extends State<RestaurantItemViewForDesktop> {
  @override
  void initState() {
    // ever(widget.cartItem, (val) {
    //   mezDbgPrint("this is the cart values ${widget.cartItem.toJson()}");
    // });
    super.initState();
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final LanguageController lang = Get.find<LanguageController>();
    return Scaffold(
      body: Obx(
        () => (widget.cartItem.value != null)
            ? Scaffold(
                floatingActionButton: Container(
                  padding: EdgeInsets.only(bottom: 0, left: 20),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(72),
                          border: Border.all(
                              color: Color.fromRGBO(224, 224, 224, 1),
                              width: 1.5),
                          color: Colors.white,
                        ),
                        width: 350,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IncrementalComponent(
                                isWeb: true,
                                btnColors: primaryBlueColor,
                                onMinValueBtnColor: Colors.grey.shade300,
                                incrementCallback: () {
                                  widget.cartItem.value!.quantity++;
                                  widget.cartItem.refresh();
                                },
                                decrementCallback: () {
                                  widget.cartItem.value!.quantity--;
                                  widget.cartItem.refresh();
                                },
                                minVal: 1,
                                value: widget.cartItem.value!.quantity,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "\$${widget.cartItem.value!.totalCost().toInt()}",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  onPressed: () async {
                                    if (Get.find<FirbaseAuthController>()
                                            .fireAuthUser !=
                                        null) {
                                      await Get.find<RestaurantController>()
                                          .addItem(widget.cartItem.value!);
                                      Get.find<MezWebSideBarController>()
                                          .openWebEndDrawer();
                                    } else {
                                      dialogRequiredSignIn(
                                          context: context,
                                          navigationCallback: () {
                                            QR.toName("signIn");
                                          });
                                    }
                                  },
                                  child: Text(
                                    " Add item ",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
                body: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MezCalmosResizer.getWepPageHorizontalPadding(
                          context)),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (widget.cartItem.value?.item.image != null &&
                                widget.cartItem.value?.item.image != "")
                            ? Container(
                                height: Get.height * 0.5,
                                color: Colors.grey[300],
                                constraints: BoxConstraints(
                                  maxHeight: Get.height * 0.5,
                                ),
                                width: Get.width,
                                child: Image.network(
                                  "${widget.cartItem.value?.item.image}",
                                  scale: 5,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${widget.cartItem.value?.item.name[lang.userLanguageKey]}",
                          style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "\$${widget.cartItem.value?.item.cost}",
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(103, 121, 254, 1)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        if (widget.cartItem.value?.item
                                .description?[lang.userLanguageKey] !=
                            null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => Text(
                                  "${_i18n()["components"]["restaurantInfoTab"]["description"]}",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "${widget.cartItem.value?.item.description?[lang.userLanguageKey]}",
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(73, 73, 73, 1)),
                              ),
                            ],
                          ),
                        if (widget.cartItem.value!.item.options.isNotEmpty)
                          Column(
                            children: List.generate(
                                widget.cartItem.value!.item.options.length,
                                (int index) => ItemOptionCard(
                                      cartItem: widget.cartItem,
                                      option: widget
                                          .cartItem.value!.item.options[index],
                                      isRunningOnWeb: true,
                                    )),
                          ),
                        SizedBox(
                          height: 15,
                        ),
                        itemNotesComponent(widget.cartItem, context),
                        SizedBox(
                          height: kToolbarHeight * 2,
                        )
                      ],
                    ),
                  ),
                ),
              )
            : Center(
                child: MezLoaderWidget(),
              ),
      ),
    );
  }
}

const Color desiableColor = Color.fromRGBO(224, 224, 224, 1);
const Color enabledColor = Color.fromRGBO(103, 121, 254, 1);

class IncreaseButton extends StatelessWidget {
  IncreaseButton(
      {Key? key,
      required this.icon,
      required this.func,
      this.bgColor = desiableColor})
      : super(key: key);
  final Icon icon;
  Color? bgColor;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: icon,
      style:
          TextButton.styleFrom(shape: CircleBorder(), backgroundColor: bgColor),
    );
  }
}

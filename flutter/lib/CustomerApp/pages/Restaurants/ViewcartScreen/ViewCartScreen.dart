import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/customerAppBar.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewcartScreen/components/viewCartBody.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';

class ViewCartScreen extends StatefulWidget {
  @override
  _ViewCartScreenState createState() => _ViewCartScreenState();
}

class _ViewCartScreenState extends State<ViewCartScreen> {
  MyPopupMenuController _popUpController = MyPopupMenuController();

  LanguageController lang = Get.find<LanguageController>();
  RestaurantController controller = Get.find<RestaurantController>();
  bool _clickedOrderNow = false;
  TextEditingController textcontoller = new TextEditingController();
  CustomerAuthController customerAuthController =
      Get.find<CustomerAuthController>();
  var listOfSavedLoacations = <SavedLocation>[];
  SavedLocation? dropDownListValue;
  // Rxn<Cart> cart = Rxn();

  @override
  void initState() {
    // listOfSavedLoacations
    //     .addAll(customerAuthController.customerStream.value!.savedLocations);

    super.initState();

    controller.cart.value.items.map((item) {
      mezDbgPrint(
          "+++ From ViewCartScreen ==> ${item.id} <= notes => ${item.notes}");
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _popUpController.hideMenu();
    _popUpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint(controller.cart.value.toLocation?.toFirebaseFormattedJson());

    responsiveSize(context);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: customerAppBar(AppBarLeftButtonType.Back, _popUpController,
          withCart: false),
      body: Obx(() => controller.cart.value.items.length > 0
          ? GetBuilder<RestaurantController>(
              // specify type as Controller
              init: RestaurantController(), // intialize with the Controller
              builder: (_) => SingleChildScrollView(child: ViewCartBody()))
          : MezLogoAnimation(
              centered: true,
            )),
    );
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}

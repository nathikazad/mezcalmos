import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/customer/cart/hsCart.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/IncrementalComponent.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewCartScreen"]["components"]["BuildItems"];

class ItemInformationCart extends StatefulWidget {
  const ItemInformationCart(
      {Key? key,
      this.imageUrl,
      required this.itemName,
      required this.restaurantName,
      required this.showImage,
      required this.itemsPrice,
      required this.item})
      : super(key: key);

  final String itemName;
  final String restaurantName;
  final bool showImage;

  final String itemsPrice;
  final String? imageUrl;
  final CartItem item;

  @override
  _ItemInformationCartState createState() => _ItemInformationCartState();
}

class _ItemInformationCartState extends State<ItemInformationCart> {
  final RestaurantController _restaurantController =
      Get.find<RestaurantController>();
  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Container(
      // width: Get.width * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.showImage)
            //===================== item image avatar=============
            Container(
              child: CachedNetworkImage(
                width: 65,
                height: 65,
                imageUrl: widget.imageUrl ?? "",
                imageBuilder: (_, ImageProvider imageProvider) {
                  return Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: imageProvider,
                      ),
                    ),
                  );
                },
                errorWidget: (_, __, ___) => Container(
                  width: 65,
                  height: 65,
                  child: Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: AssetImage(aNoImage))),
                  ),
                ),
                placeholder: (_, __) => Container(
                  width: 80,
                  height: 60,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          if (widget.showImage) const SizedBox(width: 10),
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.itemName}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: txt.headline3,
                ),
                SizedBox(
                  height: 3,
                ),
                _incrementItemComponent(widget.item)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _incrementItemComponent(CartItem cartItem) {
    return IncrementalComponent(
        minVal: 1,
        size: 14,
        minusIconColor: primaryBlueColor,
        btnColors: secondaryLightBlueColor,
        onMinValueBtnColor: secondaryLightBlueColor,
        alignment: MainAxisAlignment.start,
        incrementCallback: () {
          _restaurantController.incrementItem(cartItem.idInCart!, 1);
        },
        onChangedToZero: () async {
          await showConfirmationDialog(context,
              title: _i18n()["deleteItem"],
              primaryButtonText: _i18n()["deleteBtn"],
              helperText: _i18n()["deleteItemConfirm"], onYesClick: () async {
            _restaurantController.deleteItem(cartItem.idInCart!);
            if (_restaurantController.cart.value.quantity() == 0) {
              _restaurantController.clearCart();
              _restaurantController.cart.refresh();
              MezRouter.untill(
                  (Route route) => route.settings.name == kHomeRoute);
            } else {
              MezRouter.popDialog(closeOverlays: true);
            }
          });
        },
        value: cartItem.quantity,
        decrementCallback: () {
          _restaurantController.incrementItem(cartItem.idInCart!, -1);
        });
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/helpers/StringHelper.dart';
import 'package:mez_services_web_app/models/Generic.dart';
import 'package:mez_services_web_app/models/Services/Restaurant.dart';

import 'package:sizer/sizer.dart';

class RestaurantsListOfItemsComponent extends StatefulWidget {
  const RestaurantsListOfItemsComponent(
      {Key? key, required this.item, this.function})
      : super(key: key);
  final Item item;
  final GestureTapCallback? function;

  @override
  _RestaurantsListOfItemsComponentState createState() =>
      _RestaurantsListOfItemsComponentState();
}

class _RestaurantsListOfItemsComponentState
    extends State<RestaurantsListOfItemsComponent> {
  bool isImageExist = true;
  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    final LanguageType userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    return Card(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          child: Row(
            children: [
              if (isImageExist && widget.item.image != null)
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      CachedNetworkImageProvider(widget.item.image ?? ""),
                  onBackgroundImageError: (Object e, StackTrace? s) {
                    print(
                        "this is a test ot see if ther is images ${e.toString()}  ");
                    setState(() {
                      isImageExist = false;
                    });
                  },
                ),
              if (isImageExist)
                SizedBox(
                  width: 15,
                ),
              Flexible(
                fit: FlexFit.tight,
                flex: 5,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${widget.item.name[userLanguage]!.capitalizeFirstofEach}",
                    style: txt.headline3!.copyWith(
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("\$${widget.item.cost}",
                    style: txt.headline3!.copyWith(
                      fontSize: 13.sp,
                    )),
              )
            ],
          ),
          onTap: () {
            widget.function!();
          },
        ),
      );
    }));
  }
}

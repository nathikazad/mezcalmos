import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:sizer/sizer.dart';

class RestaurantsListOfItemsComponent extends StatefulWidget {
  const RestaurantsListOfItemsComponent({
    Key? key,
    required this.item,
    this.function,
  }) : super(key: key);
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
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Container(
        height: 75,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // if (isImageExist)
              //   CircleAvatar(
              //     radius: 30,
              //     backgroundImage:
              //         CachedNetworkImageProvider(widget.item.image ?? ""),
              //     onBackgroundImageError: (Object e, StackTrace? s) {
              //       setState(() {
              //         isImageExist = false;
              //       });
              //     },
              //   ),
              // if (isImageExist)
              SizedBox(
                width: 15,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.item.name[userLanguage]?.capitalizeFirstofEach}",
                      style: txt.headline3!.copyWith(
                        fontSize: 13.sp,
                      ),
                    ),
                    if (widget.item.isSpecial)
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          child: Text(widget.item.getPeriod!
                              .toNormalString(removeDay: true)))
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("\$${widget.item.cost}", style: txt.headline3),
              ),
              SizedBox(
                width: 3,
              ),
            ],
          ),
          onTap: () {
            widget.function!();
          },
        ),
      ),
    );
  }
}

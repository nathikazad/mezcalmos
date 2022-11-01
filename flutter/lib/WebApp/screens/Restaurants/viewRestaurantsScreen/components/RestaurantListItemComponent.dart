import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/WebApp/webHelpers/StringHelper.dart';

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
                Row(
                  children: [
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
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              // if (isImageExist)

              Flexible(
                fit: FlexFit.tight,
                flex: 5,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${widget.item.name[userLanguage]?.capitalizeFirstofEach ?? ""}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "\$${widget.item.cost}",
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
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

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class SavedlocationISEmpty extends StatelessWidget {
  const SavedlocationISEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset("assets/images/shared/noSavedLoc.png"),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Text(
              "Your Saved locations list is empty",
              style: txt.headline2!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 19),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              "Add new location by clicking the button below",
              style: txt.subtitle1!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
}

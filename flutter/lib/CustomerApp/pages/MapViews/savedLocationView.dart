import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/customerAppBar.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';

class SavedLocationView extends StatefulWidget {
  SavedLocationView({Key? key}) : super(key: key);

  @override
  _SavedLocationViewState createState() => _SavedLocationViewState();
}

class _SavedLocationViewState extends State<SavedLocationView> {
  MyPopupMenuController _popUpController = MyPopupMenuController();

  @override
  void dispose() {
    // TODO: implement dispose
    _popUpController.hideMenu();
    _popUpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customerAppBar(
        AppBarLeftButtonType.Back,
        _popUpController,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(right: 16, bottom: 10, left: 16),
                child: Row(
                  children: [
                    Container(
                      child: Text("Saved Locations",
                          style: const TextStyle(
                              color: const Color(0xff000f1c),
                              fontFamily: "psr",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left),
                    ),
                    Spacer(),
                    Container(
                      child: Text("3 Location",
                          style: const TextStyle(
                              color: const Color(0xff000f1c),
                              fontFamily: "psr",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.right),
                    )
                  ],
                ),
              ),
              SavedLocationComponent(
                subTitle: "3944 Coolidge Street, Miles City, MT 59301",
                title: "Home",
                onPress: () {},
              ),
              SavedLocationComponent(
                subTitle: "3944 Coolidge Street, Miles City, MT 59301",
                title: "My Office",
                onPress: () {},
              ),
              SavedLocationComponent(
                subTitle: "3944 Coolidge Street, Miles City, MT 59301",
                title: "Penthouse",
                onPress: () {},
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0x332362f1),
                        offset: Offset(0, 6),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ],
                  gradient: LinearGradient(
                      begin: Alignment(0.1689453125, 0),
                      end: Alignment(1, 1),
                      colors: [
                        const Color(0xff5582ff),
                        const Color(0xffc54efc)
                      ]),
                ),
                child: Center(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        style: const TextStyle(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w300,
                            fontFamily: "FontAwesome5Pro",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        text: "+ "),
                    TextSpan(
                        style: const TextStyle(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                            fontFamily: "ProductSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        text: "     Add New Location")
                  ])),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SavedLocationComponent extends StatelessWidget {
  SavedLocationComponent(
      {required this.title,
      required this.subTitle,
      required this.onPress,
      Key? key})
      : super(key: key);
  final String title;
  final String subTitle;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: const Color(0xffececec), width: 0.5),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              child: Placeholder(),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("$title",
                          style: const TextStyle(
                              color: const Color(0xff000f1c),
                              fontFamily: "psb",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text("$subTitle",
                          style: const TextStyle(
                              color: const Color(0xff000f1c),
                              fontFamily: "psr",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          softWrap: true,
                          textAlign: TextAlign.left),
                    )
                  ],
                ),
              ),
            ),
            IconSavedLocationButton(
              iCon: Container(
                  child: Icon(
                Icons.edit_outlined,
                size: 13,
                color: Color(0xffa8a8a8),
              )),
              ontap: () {
                print("clicked on the component edit");
              },
            ),
            SizedBox(
              width: 5,
            ),
            IconSavedLocationButton(
              iCon: Container(
                  child: Icon(
                Icons.delete_outline,
                size: 13,
                color: Color(0xffa8a8a8),
              )),
              ontap: () {
                print("clicked on the component delete");
              },
            )
          ],
        ),
      ),
      onTap: onPress,
    );
  }
}

class IconSavedLocationButton extends StatelessWidget {
  const IconSavedLocationButton(
      {required this.iCon, required this.ontap, Key? key})
      : super(key: key);
  final Widget iCon;
  final GestureTapCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          boxShadow: [
            BoxShadow(
                color: const Color(0x33c5c5c5),
                offset: Offset(0, 10),
                blurRadius: 10,
                spreadRadius: 0)
          ],
          color: const Color(0xffffffff),
        ),
        child: iCon,
      ),
      onTap: ontap,
    );
  }
}

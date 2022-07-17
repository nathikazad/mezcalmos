import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/WebApp/main.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'Components/components.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final scrollDirection = Axis.vertical;

  late AutoScrollController controller;
  //late LanguageController langController;

  @override
  void initState() {
    // if (!Get.isRegistered<LanguageController>() ||
    //     Get.isRegistered<FirebaseDb>()) {
    //   //dotenv.env['LMODE'].toString().toLaunchMode()
    //   setupFirebase(dotenv.env['LMODE'].toString().toLaunchMode())
    //       .then((value) {
    //     langController = Get.find<LanguageController>();
    //   });
    // }
    controller = AutoScrollController(
        viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, Get.height),
        axis: scrollDirection);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(langController.userLanguageKey.toString());
    return FutureBuilder<bool>(
        future: setupFirebase(launchMode: "stage".toLaunchMode()),
        builder: (context, snapShot) {
          if (snapShot.hasData && snapShot.data == true) {
            final LanguageController Lcontroller =
                Get.find<LanguageController>();

            return Scaffold(
              backgroundColor: Colors.white,
              drawerEnableOpenDragGesture: false,
              key: _key,
              drawer: MezCalmosResizer.isMobile(context)
                  ? DrawerComponent(
                      controller: controller,
                    )
                  : null,
              appBar: WebAppBar(
                golbalKey: _key,
                controller: controller,
              ),
              body: LayoutBuilder(
                // If our width is more than 1100 then we consider it a desktop
                builder: (context, constraints) {
                  return IndexBodyWidget(
                    controller: controller,
                    scrollDirection: scrollDirection,
                  );
                },
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

class IndexBodyWidget extends StatefulWidget {
  const IndexBodyWidget(
      {Key? key, required this.scrollDirection, required this.controller})
      : super(key: key);
  final Axis scrollDirection;
  final AutoScrollController controller;
  @override
  State<IndexBodyWidget> createState() => _IndexBodyWidgetState();
}

class _IndexBodyWidgetState extends State<IndexBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: widget.scrollDirection,
      controller: widget.controller,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// this part of Code [WepAppIndexBodyIntroductionComponent()] shows the small intro of the mezcalos app
          /// it shows the mobile images and to type of text

          WepAppIndexBodyIntroductionComponent(
            controller: widget.controller,
          ),

          /// this part of code [ServicesPartComponent()] shows all mezcalos services
          ///
          AutoScrollTag(
            key: ValueKey(0),
            controller: widget.controller,
            index: 0,
            child: ServicesPartComponent(),
          ),

          /// this part of code [FrequentlyAskedQuestions()] shows all frequent asked questions
          AutoScrollTag(
            key: ValueKey(1),
            controller: widget.controller,
            index: 1,
            child: FrequentlyAskedQuestions(),
          ),

          /// this part of code [BlogPartComponent()] shows a list of blogs

          AutoScrollTag(
            key: ValueKey(2),
            controller: widget.controller,
            index: 2,
            child: BlogPartComponent(),
          ),

          /// this part of code [FormForQuestionAndFeedBack()] allows users to ask question or give feedback

          AutoScrollTag(
            key: ValueKey(3),
            controller: widget.controller,
            index: 3,
            child: FormForQuestionAndFeedBack(),
          ),

          /// this part of code [GetAppForAndroidAndIosComponent()] allows users to download app for android and ios

          AutoScrollTag(
            key: ValueKey(4),
            controller: widget.controller,
            index: 4,
            child: GetAppForAndroidAndIosComponent(),
          ),

          /// this part of code [WebSiteFotterWedgetComponent()] is a fotter for the app

          WebSiteFotterWedgetComponent(
            controller: widget.controller,
          ),
        ],
      ),
    );
  }
}

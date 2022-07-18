import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sizer/sizer.dart';
import '../HomeView/Components/components.dart';
import '../../main.dart';
import '../../services/widgets/mezCalmosResizer.dart';

class BlogsView extends StatefulWidget {
  BlogsView({Key? key}) : super(key: key);

  @override
  State<BlogsView> createState() => _BlogsViewState();
}

class _BlogsViewState extends State<BlogsView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final scrollDirection = Axis.vertical;

  late AutoScrollController controller;
  @override
  void initState() {
    controller = AutoScrollController(
        viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, Get.height),
        axis: scrollDirection);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
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
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal:
                                  MezCalmosResizer.getWepPageHorizontalPadding(
                                      context)),
                          child: Text(
                            "Our news & tips, let's go behind the scenes at Mezcalmos",
                            style: txt.bodyText1!.copyWith(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                fontSize: getSizeForTitle(context)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal:
                                  MezCalmosResizer.getWepPageHorizontalPadding(
                                      context)),
                          child: GetBolgsGridList(context, null),
                        ),
                        (MezCalmosResizer.isSmallMobile(context) ||
                                MezCalmosResizer.isMobile(context))
                            ? Container()
                            : WebSiteFotterWedgetComponent(
                                controller: controller,
                              ),
                      ],
                    ),
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

  double getSizeForTitle(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 8.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 9.sp;
    } else if (MezCalmosResizer.isSmallMobile(context)) {
      return 18.sp;
    } else {
      return 15.sp;
    }
  }
}

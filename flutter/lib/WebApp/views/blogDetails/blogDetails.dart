import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/WebApp/controllers/blogController.dart';
import 'package:mezcalmos/WebApp/services/Models/blogModle.dart';
import 'package:mezcalmos/WebApp/services/values/globals.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../main.dart';
import '../HomeView/Components/components.dart';
//
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';

class BlogDetails extends StatefulWidget {
  BlogDetails({Key? key}) : super(key: key);

  @override
  State<BlogDetails> createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final scrollDirection = Axis.vertical;

  late AutoScrollController controller;
  late String index;

  @override
  void initState() {
    controller = AutoScrollController(
        viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, Get.height),
        axis: scrollDirection);
    var x = Get.parameters["name"];
    index = Get.parameters['index'].toString();
    print("the name is $x , and index is ${index.toString()}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return FutureBuilder<bool>(
        future: setupFirebase(launchMode: typeMode.toLaunchMode()),
        builder: (context, snapShot) {
          if (snapShot.hasData && snapShot.data == true) {
            final LanguageController Lcontroller =
                Get.find<LanguageController>();

            final BolgController bolgController = Get.find<BolgController>();

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
                  return Container(
                    child: FutureBuilder<BlogModel?>(
                      future: bolgController.getBlogByID(int.parse(index)),
                      builder: (BuildContext context,
                          AsyncSnapshot<BlogModel?> snapppshot) {
                        if (snapppshot.hasData && snapppshot.data != null) {
                          var blog = snapppshot.data;

                          return SingleChildScrollView(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              // padding: EdgeInsets.symmetric(
                              //     vertical: 20,
                              //     horizontal: MezCalmosResizer
                              //         .getWepPageHorizontalPadding(context)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  //title
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MezCalmosResizer
                                            .getWepPageHorizontalPadding(
                                                context)),
                                    alignment: Alignment.center,
                                    child: Text(blog!.title,
                                        textAlign: TextAlign.left,
                                        style: txt.bodyText1!.copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "Montserrat",
                                            fontSize:
                                                getSizeForTitle(context))),
                                  ),

                                  //TODO: add date and author
                                  //date
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MezCalmosResizer
                                            .getWepPageHorizontalPadding(
                                                context)),
                                    alignment: Alignment.center,
                                    child: RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '${blog.date.toString()}',
                                              style: txt.bodyText1!.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Colors.black45,
                                                  fontFamily: "Nunito",
                                                  fontSize:
                                                      getSizeForDate(context))),
                                          TextSpan(
                                              text: ' by ',
                                              style: txt.bodyText1!.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontFamily: "Nunito",
                                                  color: Colors.black45,
                                                  fontSize:
                                                      getSizeForDate(context))),
                                          TextSpan(
                                              text: ' ${blog.authorName}',
                                              style: txt.bodyText1!.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontFamily: "Nunito",
                                                  color: myColor,
                                                  fontSize:
                                                      getSizeForDate(context))),
                                        ],
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MezCalmosResizer
                                            .getWepPageHorizontalPadding(
                                                context)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network("${blog.img}"),
                                    ),
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MezCalmosResizer
                                            .getWepPageHorizontalPadding(
                                                context)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Blog",
                                            style: txt.bodyText1!.copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Montserrat",
                                                fontSize: getSizeForSubtitle(
                                                    context))),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          ">",
                                          style: TextStyle(
                                            fontSize:
                                                getSizeForSubtitle(context),
                                            color: myColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Flexible(
                                            child: Text("${blog.title}",
                                                style: txt.bodyText1!.copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: "Montserrat",
                                                    fontSize:
                                                        getSizeForSubtitle(
                                                            context)))),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MezCalmosResizer
                                            .getWepPageHorizontalPadding(
                                                context)),
                                    child: buildContent(blog.content!, context),
                                  ),

                                  WebSiteFotterWedgetComponent(
                                    controller: controller,
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Center(
                            child: MezLogoAnimation(
                              h: 200,
                              w: 200,
                              centered: true,
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: MezLogoAnimation(
                  h: 200,
                  w: 200,
                  centered: true,
                ),
              ),
            );
          }
        });
  }

  double getSizeForTitle(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 5.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 5.5.sp;
    } else if (MezCalmosResizer.isSmallMobile(context)) {
      return 14.sp;
    } else {
      return 11.sp;
    }
  }

  double getSizeForDate(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 2.5.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 3.sp;
    } else if (MezCalmosResizer.isSmallMobile(context)) {
      return 10.sp;
    } else {
      return 7.sp;
    }
  }
}

double getSizeForSubtitle(BuildContext context) {
  if (MezCalmosResizer.isDesktop(context)) {
    return 4.sp;
  } else if (MezCalmosResizer.isTablet(context) ||
      MezCalmosResizer.isSmallTablet(context)) {
    return 4.5.sp;
  } else if (MezCalmosResizer.isSmallMobile(context)) {
    return 13.sp;
  } else {
    return 10.sp;
  }
}

// Widget? buildTitle(int index, RssItem item) {
//   if (index == 0) {
//     return null;
//   } else {
//     return Text(
//       "${item.title}",
//       style: TextStyle(color: Colors.blue),
//     );
//   }
// }

Widget buildContent(String? content, BuildContext context) {
  List<Widget> resultWidget = <Widget>[];

  if (content != null) {
    resultWidget.add(Container(
      child: Theme(
        data: ThemeData(
            textTheme: TextTheme(
                bodyText1: TextStyle(fontFamily: "Nunito", color: Colors.red))),
        child: Html(
          style: {
            "p": Style(
                fontFamily: "Nunito",
                fontSize: FontSize(getSizeForSubtitle(context)),
                color: Color.fromRGBO(73, 73, 73, 1))
          },
          data: """
                 <p> $content</p>
                    """,
        ),
      ),
    ));
  }

  return Container(
    child: Column(
      children: resultWidget,
    ),
  );
}

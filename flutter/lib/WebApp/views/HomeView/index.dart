import 'package:flutter/material.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
import 'package:sizer/sizer.dart';
import 'Components/components.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawerEnableOpenDragGesture: false,
      key: _key,
      drawer: MezCalmosResizer.isMobile(context) ? DrawerComponent() : null,
      appBar: WebAppBar(
        golbalKey: _key,
      ),
      body: LayoutBuilder(
        // If our width is more than 1100 then we consider it a desktop
        builder: (context, constraints) {
          return IndexBodyWidget();
        },
      ),
    );
  }
}

class IndexBodyWidget extends StatelessWidget {
  const IndexBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// this part of Code [WepAppIndexBodyIntroductionComponent()] shows the small intro of the mezcalos app
          /// it shows the mobile images and to type of text
          WepAppIndexBodyIntroductionComponent(),

          /// this part of code [ServicesPartComponent()] shows all mezcalos services
          ServicesPartComponent(),

          /// this part of code [FrequentlyAskedQuestions()] shows all frequent asked questions
          FrequentlyAskedQuestions(),

          /// this part of code [BlogPartComponent()] shows a list of blogs
          BlogPartComponent(),

          /// this part of code [FormForQuestionAndFeedBack()] allows users to ask question or give feedback
          FormForQuestionAndFeedBack(),

          /// this part of code [GetAppForAndroidAndIosComponent()] allows users to download app for android and ios
          GetAppForAndroidAndIosComponent(),

          /// this part of code [WebSiteFotterWedgetComponent()] is a fotter for the app
          WebSiteFotterWedgetComponent(),
        ],
      ),
    );
  }
}

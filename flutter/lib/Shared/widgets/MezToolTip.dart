import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/widgets/ToolTipTrianglePainter.dart';

/// this is not being used currently but later on, i believe we will use it !
typedef void OnToolTipCloseNotifier();

/// This is a class Helper where we specify the Hint Widget.
///
/// Along with the Coords of the Hint Triangle [left] , [top] , [right] , [bottom] , basically Positioned(left, top , right , bottom)
/// And the Body's Positioned values [left] , [top] , [right] , [bottom]
class MezToolTipHint {
  Widget hintWidget;
  // triangle's
  double? left;
  double? top;
  double? right;
  double? bottom;
  // body's
  double? bodyLeft;
  double? bodyTop;
  double? bodyRight;
  double? bodyBottom;

  OnToolTipCloseNotifier? onHintClose;

  MezToolTipHint(
      {required this.hintWidget,
      this.left,
      this.top,
      this.right,
      this.bottom,
      this.bodyLeft,
      this.bodyTop,
      this.bodyRight,
      this.bodyBottom,
      this.onHintClose});

  @override
  String toString() {
    return "${hintWidget.runtimeType}  : [ left : $left | top : $top | right : $right | bottom : $bottom ] ";
  }
}

class MezToolTip extends StatefulWidget {
  final List<MezToolTipHint> hintWidgetsList;
  final bool applyCacheIncrementing;
  const MezToolTip(
      {Key? key,
      this.hintWidgetsList = const [],
      this.applyCacheIncrementing = true})
      : super(key: key);

  @override
  _MezToolTipState createState() => _MezToolTipState();
}

class _MezToolTipState extends State<MezToolTip> {
  RxInt currentHintIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => currentHintIndex.value >= widget.hintWidgetsList.length
          ? SizedBox()
          : blackTopOverlay(),
    );
  }

  /// the main Black Overlay that sits on top of the ParentView.
  Container blackTopOverlay() {
    return Container(
      color: Colors.transparent,
      width: Get.width,
      height: Get.height,
      child: Stack(
        alignment: Alignment.bottomLeft,
        fit: StackFit.passthrough,
        children: [
          Positioned(
              bottom: widget.hintWidgetsList[currentHintIndex.value].bodyBottom,
              left: widget.hintWidgetsList[currentHintIndex.value].bodyLeft,
              right: widget.hintWidgetsList[currentHintIndex.value].bodyRight,
              top: widget.hintWidgetsList[currentHintIndex.value].bodyTop,
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  toolTipBody(),
                  toolTipCloseButton(),
                ],
              )),
          toolTipTriangle(),
        ],
      ),
    );
  }

  /// this has the Actual ToolTip Body which is a wodget comming from [MezToolTipHint.hintWidget] .
  Container toolTipBody() {
    return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
        decoration: BoxDecoration(
          color: Color.fromRGBO(225, 228, 255, 1),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              offset: Offset(2.47, 2.47),
              blurRadius: 8.23,
              spreadRadius: 0,
              color: Color.fromRGBO(175, 175, 175, 0.5),
            ),
          ],
          // border: Border.all(
          //   color: Colors.grey,
          //   width: 1,
          // ),
        ),
        child: widget.hintWidgetsList[currentHintIndex.value].hintWidget);
  }

  /// This is the Triangle that points on an [x1, y1, x2, y2] Coords on the screen
  ///
  /// [x1, y1, x2, y2] are comming from [MezToolTipHint] Object.
  AnimatedPositioned toolTipTriangle() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      left: widget.hintWidgetsList[currentHintIndex.value].left,
      top: widget.hintWidgetsList[currentHintIndex.value].top,
      right: widget.hintWidgetsList[currentHintIndex.value].right,
      bottom: widget.hintWidgetsList[currentHintIndex.value].bottom,
      child: CustomPaint(
        painter: ToolTipTrianglePainter(
          backGroundColor: Color.fromRGBO(225, 228, 255, 1),
        ),
      ),
    );
  }

  /// this is the Close Button on the toolTip with it's onTap event.
  Positioned toolTipCloseButton() {
    return Positioned(
      top: 5,
      right: 5,
      child: InkWell(
        onTap: () {
          if (currentHintIndex.value == widget.hintWidgetsList.length - 1 &&
              widget.applyCacheIncrementing) {
            //  Get.find<TaxiController>().increaseNumOfTimesToolTipShownToUser();
          }
          // this is user in case we want some advanced stuff later on , on each hint close.
          widget.hintWidgetsList[currentHintIndex.value].onHintClose?.call();

          currentHintIndex.value += 1;
        },
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(225, 228, 255, 1), shape: BoxShape.circle),
          height: 20,
          width: 20,
          child: Center(
            child: Icon(Icons.close, size: 14, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

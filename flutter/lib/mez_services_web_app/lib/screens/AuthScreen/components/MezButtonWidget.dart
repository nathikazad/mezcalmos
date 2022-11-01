import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MezButton extends StatefulWidget {
  const MezButton(
      {Key? key,
      this.backColor = Colors.black,
      required this.content,
      this.onPress,
      this.width,
      this.borderColor,
      this.borderTechniess = 1,
      this.btnMargin = const EdgeInsets.symmetric(horizontal: 15)})
      : super(key: key);

  final Color? backColor;
  final Widget content;
  final double? width;
  final VoidCallback? onPress;
  final EdgeInsetsGeometry? btnMargin;
  final Color? borderColor;
  final double? borderTechniess;
  @override
  _MezButtonState createState() => _MezButtonState();
}

class _MezButtonState extends State<MezButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      width: widget.width ?? Get.width,

      margin: widget.btnMargin,
      child: TextButton(
        onPressed: widget.onPress,
        child: widget.content,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),

          shape: RoundedRectangleBorder(
              side: widget.borderColor != null
                  ? BorderSide(
                      color: widget.borderColor!,
                      width: widget.borderTechniess!)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(5)),
          primary: Colors.grey,
          backgroundColor: widget.backColor,

          // padding: EdgeInsets.all(12),
          textStyle: const TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
      ).paddingAll(0)
        ..marginAll(0),
    );
  }
}

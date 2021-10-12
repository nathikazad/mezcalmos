import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckBoxComponent extends StatefulWidget {
  final String? title;
  final GestureTapCallback? ontab;
  final ValueChanged<bool?>? onValueChanged;
  final EdgeInsetsGeometry? padding;
  final bool? intailVal;
  CheckBoxComponent(
      {this.title,
      this.padding,
      this.ontab,
      this.onValueChanged,
      this.intailVal = false});

  @override
  _CheckBoxComponentState createState() => _CheckBoxComponentState();
}

class _CheckBoxComponentState extends State<CheckBoxComponent> {
  var isTure;
  @override
  Widget build(BuildContext context) {
    isTure = (widget.intailVal != null) ? widget.intailVal : false;
    return Container(
      padding: widget.padding,
      child: InkWell(
        child: Row(
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                disabledColor: Colors.transparent,
                unselectedWidgetColor: Colors.transparent,
              ),
              child: SizedBox(
                width: 22,
                height: 21,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: (!isTure) ? Colors.black : Color(0xff5c7fff),
                          width: 2)),
                  clipBehavior: Clip.hardEdge,
                  child: Transform.scale(
                    scale: 19 / Checkbox.width,
                    child: Checkbox(
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      activeColor: Colors.transparent,
                      checkColor: Color(0xff5c7fff),
                      value: isTure,
                      onChanged: (value) {
                        setState(() {
                          isTure = !isTure;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            // Checkbox(
            //   value: isTure,
            //   activeColor: Color(0xff5c7fff),
            //   fillColor:Colors.white,
            //   checkColor: Colors.white, // color of tick Mark
            //   onChanged: (bool? newValue) {
            //     setState(() {
            //       isTure = !isTure;
            //     });
            //   },
            // ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Container(
              child: Text("${widget.title}",
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w400,
                        fontFamily: "ProductSans",
                        fontStyle: FontStyle.normal,
                        fontSize: 17.0),
                  ),
                  textAlign: TextAlign.left),
            ))
          ],
        ),
        onTap: () {
          setState(() {
            isTure = !isTure;
          });
          widget.onValueChanged!.call(isTure);
          // widget.ontab!();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewItemScreenCartComponent extends StatefulWidget {
  final String? title;
  final String? price;
  final GestureTapCallback? ontab;
  final ValueChanged<bool?>? onValueChanged;
  final bool? intailVal;
  ViewItemScreenCartComponent(
      {this.ontab,
      this.onValueChanged,
      this.title,
      this.price,
      this.intailVal = false});

  @override
  _ViewItemScreenCartComponentState createState() =>
      _ViewItemScreenCartComponentState();
}

class _ViewItemScreenCartComponentState
    extends State<ViewItemScreenCartComponent> {
  bool? isTure;
  @override
  void initState() {
    isTure = widget.intailVal != null ? widget.intailVal : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;

    isTure = widget.intailVal != null ? widget.intailVal : false;
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      height: (widget.price == null) ? 70 : null,
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: isTure! ? Color.fromRGBO(172, 89, 252, 1) : Colors.white,
                width: 1.5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "${widget.title}",
                        style: txt.headline3,
                      ),
                    ),
                    (widget.price == null)
                        ? Container()
                        : Container(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              "${widget.price}",
                              style: txt.headline2!.copyWith(
                                  color: Color.fromRGBO(172, 89, 252, 1)),
                            ),
                          )
                  ],
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  disabledColor: Colors.transparent,
                  unselectedWidgetColor: Colors.transparent,
                ),
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: (isTure != null)
                                ? Color.fromRGBO(172, 89, 252, 1)
                                : Color(0xff5c7fff),
                            width: 2)),
                    clipBehavior: Clip.hardEdge,
                    child: Transform.scale(
                      scale: 22 / Checkbox.width,
                      child: Checkbox(
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        activeColor: Color.fromRGBO(172, 89, 252, 1),
                        checkColor: Color(0xffffffff),
                        value: isTure,
                        onChanged: (value) {
                          setState(() {
                            if (isTure!)
                              isTure = false;
                            else
                              isTure = true;
                            widget.onValueChanged!.call(isTure);
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          // print(isTure);
          setState(() {
            if (isTure!)
              isTure = false;
            else
              isTure = true;
            widget.onValueChanged!.call(isTure);
          });
        },
      ),
    );
  }
}

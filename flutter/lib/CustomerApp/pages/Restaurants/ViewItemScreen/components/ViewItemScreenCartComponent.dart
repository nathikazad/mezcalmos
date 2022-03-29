import 'package:flutter/material.dart';

class ViewItemScreenCartComponent extends StatefulWidget {
  final String? title;
  final String? price;
  final GestureTapCallback? onTap;
  final ValueChanged<bool?>? onValueChanged;
  final bool? initialVal;

  const ViewItemScreenCartComponent({
    this.onTap,
    this.onValueChanged,
    this.title,
    this.price,
    this.initialVal = false,
  });

  @override
  _ViewItemScreenCartComponentState createState() =>
      _ViewItemScreenCartComponentState();
}

class _ViewItemScreenCartComponentState
    extends State<ViewItemScreenCartComponent> {
  bool? isTure;

  @override
  void initState() {
    isTure = widget.initialVal != null ? widget.initialVal : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    isTure = widget.initialVal != null ? widget.initialVal : false;
    return Container(
      margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
      child: InkWell(
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: isTure! ? Color.fromRGBO(172, 89, 252, 1) : Colors.white,
                width: 2),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Text(
                  "${widget.title}" +
                      "${(widget.price == null) ? " " : " +${widget.price}"}",
                  style: textTheme.bodyText1,
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
                        width: 2,
                      ),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Transform.scale(
                      scale: 22 / Checkbox.width,
                      child: Checkbox(
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        activeColor: Color.fromRGBO(172, 89, 252, 1),
                        checkColor: Color(0xffffffff),
                        value: isTure,
                        onChanged: (bool? value) {
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

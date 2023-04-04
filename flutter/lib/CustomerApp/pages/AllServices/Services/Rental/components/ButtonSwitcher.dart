import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class ButtonSwitcher extends StatefulWidget {
  const ButtonSwitcher({
    super.key,
    required this.lButtonText,
    required this.rButtonText,
    required this.iconList,
    required this.values,
    required this.selectedValue,
    required this.onClick,
  });

  final String lButtonText;
  final String rButtonText;
  final List<IconData> iconList;
  final List<Enum> values;
  final Enum selectedValue;
  final void Function(Enum) onClick;

  @override
  State<ButtonSwitcher> createState() => _ButtonSwitcherState();
}

class _ButtonSwitcherState extends State<ButtonSwitcher> {
  @override
  Widget build(BuildContext context) {
    var txt = Theme.of(context).textTheme;
    return Row(
      children: [
        Flexible(
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () {
              widget.onClick(widget.values[0]);
            },
            child: Ink(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: (widget.values[0] == widget.selectedValue)
                      ? primaryBlueColor
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.iconList.first,
                      color: (widget.values[0] == widget.selectedValue)
                          ? Colors.white
                          : Colors.grey.shade700,
                      size: 20,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Flexible(
                      child: Text(
                        widget.lButtonText,
                        style: txt.bodyLarge?.copyWith(
                          color: (widget.values[0] == widget.selectedValue)
                              ? Colors.white
                              : Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Flexible(
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () {
              widget.onClick(widget.values[1]);
            },
            child: Ink(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: (widget.values[1] == widget.selectedValue)
                      ? primaryBlueColor
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.iconList.last,
                      color: (widget.values[1] == widget.selectedValue)
                          ? Colors.white
                          : Colors.grey.shade700,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text(
                        widget.rButtonText,
                        style: txt.bodyLarge?.copyWith(
                          color: (widget.values[1] == widget.selectedValue)
                              ? Colors.white
                              : Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

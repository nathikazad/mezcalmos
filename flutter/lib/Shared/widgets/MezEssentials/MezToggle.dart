import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezIconButton.dart';

class MezToggle extends StatefulWidget {
  final String title;
  final Widget content;

  const MezToggle({required this.title, required this.content});

  @override
  _MezToggleState createState() => _MezToggleState();
}

class _MezToggleState extends State<MezToggle> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8.0),
            decoration: BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(widget.title, style: context.textTheme.bodyLarge),
                ),
                hSmallSepartor,
                MezIconButton(
                  padding: const EdgeInsets.all(2),
                  iconColor: _isExpanded ? primaryBlueColor : Colors.black,
                  backgroundColor: _isExpanded
                      ? secondaryLightBlueColor
                      : Colors.grey.shade300,
                  elevation: 0,
                  icon:
                      _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  onTap: null,
                ),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: _isExpanded ? null : 0,
          child: _isExpanded
              ? Padding(
                  padding: EdgeInsets.all(5),
                  child: widget.content,
                )
              : SizedBox.shrink(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class AssetCard extends StatelessWidget {
  const AssetCard({
    super.key,
    required this.title,
    this.subtitleWidget = const Offstage(),
    required this.image,
    required this.onClick,
    this.lBottomText = "",
    this.rBottomText = "",
    this.needDivider = true,
    this.needBottomTitleText = true,
    this.needLeadingImage = false,
    this.needTrailingImage = true,
    this.needCustomSubtitle = true,
    this.subtitleIconData = const <String>[],
    this.subtitleIconString = const <String>[],
    this.leftBottomIcon = null,
  });

  final String title;
  final Function onClick;
  final Widget subtitleWidget;
  final String lBottomText;
  final String rBottomText;
  final NetworkImage image;
  final bool needDivider;
  final bool needBottomTitleText;
  final bool needLeadingImage;
  final bool needTrailingImage;
  final List<String> subtitleIconData;
  final List<String> subtitleIconString;
  final bool needCustomSubtitle;
  final Widget? leftBottomIcon;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: MezCard(
        onClick: () {
          onClick();
        },
        contentPadding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 6,
        ),
        leading: needLeadingImage
            ? CircleAvatar(
                radius: 20,
                backgroundImage: image,
              )
            : const Offstage(),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            title,
                            style: style.headlineMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        needCustomSubtitle
                            ? Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: subtitleWidget,
                              )
                            : Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    for (int index = 0;
                                        index < subtitleIconData.length;
                                        index++)
                                      Row(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                              subtitleIconData[index],
                                            ),
                                          ),
                                          Text(
                                            subtitleIconString[index],
                                            style: style.bodyMedium,
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                  needTrailingImage
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: ColoredBox(
                            color: Colors.grey.withOpacity(0.1),
                            child: SizedBox(
                              height: 64,
                              width: 64,
                              child: Image(
                                height: 64,
                                width: 64,
                                image: image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      : const Offstage(),
                ],
              ),
            ),
            needDivider ? const Divider() : const Offstage(),
            needBottomTitleText
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      leftBottomIcon == null
                          ? Text(lBottomText)
                          : Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: leftBottomIcon ??
                                      Icon(
                                        Icons.access_time_filled,
                                      ),
                                ),
                                Text(lBottomText),
                              ],
                            ),
                      Text(rBottomText),
                    ],
                  )
                : const Offstage(),
          ],
        ),
      ),
    );
  }
}

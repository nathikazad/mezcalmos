import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class AgencyListTile extends StatelessWidget {
  const AgencyListTile({
    super.key,
    required this.titleText,
    required this.rating,
    required this.iconsList,
    required this.image,
    required this.onClick,
    this.needMessageButton = false,
    this.onMessageClick = null,
  });

  final String titleText;
  final String rating;
  final List<IconData> iconsList;
  final NetworkImage image;
  final Function onClick;
  final bool needMessageButton;
  final void Function()? onMessageClick;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: MezCard(
        onClick: () {
          onClick();
        },
        firstAvatarBgImage: image,
        action: needMessageButton
            ? IconButton(
                icon: Icon(
                  Icons.textsms,
                  color: primaryBlueColor,
                ),
                onPressed: () {
                  if (onMessageClick != null) {
                    onMessageClick!();
                  }
                },
              )
            : null,
        contentPadding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                titleText,
                style: style.headlineMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                for (int index = 0; index < iconsList.length; index++)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      iconsList[index],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.star,
                    color: primaryBlueColor,
                  ),
                ),
                Text(
                  rating,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

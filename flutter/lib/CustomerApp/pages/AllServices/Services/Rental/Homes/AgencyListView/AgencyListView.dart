import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class AgencyListView extends StatefulWidget {
  const AgencyListView({super.key});

  @override
  State<AgencyListView> createState() => _AgencyListViewState();
}

class _AgencyListViewState extends State<AgencyListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return AgencyIconListTile(
              titleText: "Puetro Estate",
              rating: "4.9",
              image: NetworkImage(customImageUrl),
              iconsList: [
                Icons.credit_card,
                Icons.payments,
              ],
            );
          },
        ),
      ),
    );
  }
}

class AgencyIconListTile extends StatelessWidget {
  const AgencyIconListTile({
    super.key,
    required this.titleText,
    required this.rating,
    required this.iconsList,
    required this.image,
  });

  final String titleText;
  final String rating;
  final List<IconData> iconsList;
  final NetworkImage image;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: MezCard(
        firstAvatarBgImage: image,
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

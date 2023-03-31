import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class AgencyServiceListView extends StatefulWidget {
  const AgencyServiceListView({super.key});

  @override
  State<AgencyServiceListView> createState() => _AgencyServiceListViewState();
}

class _AgencyServiceListViewState extends State<AgencyServiceListView> {
  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: MezCard(
                firstAvatarBgImage: AssetImage(aDelivery),
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
                        "Puetro Estate",
                        style: style.headlineMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.payments,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Icon(
                            Icons.payment,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Icon(
                            Icons.star,
                            color: primaryBlueColor,
                          ),
                        ),
                        Text(
                          "4.9",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

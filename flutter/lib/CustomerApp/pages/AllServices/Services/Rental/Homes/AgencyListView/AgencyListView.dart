import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AgencyListTile.dart';
import '../AgencyServiceView/AgencyServiceView.dart';

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
            return AgencyListTile(
              onClick: () {
                AgencyServiceView.navigate();
              },
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

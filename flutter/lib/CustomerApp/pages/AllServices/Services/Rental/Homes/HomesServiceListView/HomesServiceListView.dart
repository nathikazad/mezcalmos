import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class HomesServiceListView extends StatefulWidget {
  const HomesServiceListView({super.key});

  @override
  State<HomesServiceListView> createState() => _HomesServiceListViewState();
}

class _HomesServiceListViewState extends State<HomesServiceListView> {
  @override
  Widget build(BuildContext context) {
    var txt = Theme.of(context).textTheme;
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: MezCard(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'First Text',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Second Text',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ColoredBox(
                          color: Colors.grey.withOpacity(0.1),
                          child: SizedBox(
                            height: 64,
                            width: 64,
                            child: Image.asset(
                              aHomes,
                              height: 64,
                              width: 64,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Text("Company Name"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

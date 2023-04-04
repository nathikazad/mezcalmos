import 'package:flutter/material.dart';

class AgencyInfoTab extends StatefulWidget {
  const AgencyInfoTab({super.key});

  @override
  State<AgencyInfoTab> createState() => _AgencyInfoTabState();
}

class _AgencyInfoTabState extends State<AgencyInfoTab> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Text("Info Tab");
            },
            childCount: 1,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';

class InfEarningsView extends StatefulWidget {
  const InfEarningsView({super.key});

  @override
  State<InfEarningsView> createState() => _InfEarningsViewState();
}

class _InfEarningsViewState extends State<InfEarningsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Menu, title: "Earnings"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}

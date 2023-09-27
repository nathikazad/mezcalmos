import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';

class DvOrderView extends StatefulWidget {
  const DvOrderView({super.key});

  @override
  State<DvOrderView> createState() => _DvOrderViewState();
}

class _DvOrderViewState extends State<DvOrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(),
      ),
    );
  }
}

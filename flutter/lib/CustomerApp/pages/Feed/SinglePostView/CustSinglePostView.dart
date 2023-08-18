import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class CustSinglePostView extends StatefulWidget {
  const CustSinglePostView({super.key});

  Future<void> navigate({required int postId}) async {
    final String route =
        CustomerRoutes.kSinglePostRoute.replaceFirst(":id", "$postId");
    await MezRouter.toPath(route);
  }

  @override
  State<CustSinglePostView> createState() => _CustSinglePostViewState();
}

class _CustSinglePostViewState extends State<CustSinglePostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

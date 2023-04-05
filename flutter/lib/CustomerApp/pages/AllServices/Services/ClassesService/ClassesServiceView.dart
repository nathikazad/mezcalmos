import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/router/classesRoute.dart';

class ClassesServiceView extends StatefulWidget {
  const ClassesServiceView({super.key});

  @override
  State<ClassesServiceView> createState() => _ClassesServiceViewState();

  static Future<void> navigate() {
    return MezRouter.toPath(ClassesRoutes.classesViewRoute);
  }
}

class _ClassesServiceViewState extends State<ClassesServiceView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

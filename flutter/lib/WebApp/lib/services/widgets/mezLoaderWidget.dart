import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MezLoaderWidget extends StatelessWidget {
  const MezLoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(
          color: Color.fromRGBO(103, 121, 254, 1),
          strokeWidth: 4,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Loading, please wait..",
          style: GoogleFonts.montserrat(
              color: Color.fromRGBO(103, 121, 254, 1),
              fontSize: 15,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

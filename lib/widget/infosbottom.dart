import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoBottom extends StatelessWidget {
  const InfoBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: 'Created By ',
                  style: TextStyle(
                    color: Colors.grey[700],
                  )),
              TextSpan(
                text: 'A-Karim7',
                style: GoogleFonts.acme(
                    color: const Color.fromARGB(255, 112, 119, 249),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ])),
      ],
    ));
  }
}

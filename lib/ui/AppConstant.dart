import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppConstant {
  static TextStyle textFancyheader = GoogleFonts.sourceSerif4(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: Color.fromARGB(255, 248, 248, 246));

  static TextStyle textError = TextStyle(
    color: Colors.red[300],
    fontSize: 20,
  );

  static TextStyle textLink =
      const TextStyle(color: Color.fromARGB(255, 40, 148, 255));
  static TextStyle textLinkDark =
      const TextStyle(color: Color.fromARGB(255, 9, 11, 14));

  static TextStyle textBody =
      const TextStyle(color: Color.fromARGB(255, 40, 148, 255), fontSize: 20);
  static TextStyle textBodyFocus =
      const TextStyle(color: Color.fromARGB(255, 216, 222, 227), fontSize: 18);

  static Color mainColor = Color.fromARGB(212, 229, 79, 240);
  static Color secondaryColor = Color.fromARGB(255, 233, 119, 233);
  static Color thirdColor = const Color.fromARGB(255, 40, 148, 255);

  static bool isDate(String str) {
    try {
      var inputFormat = DateFormat('dd/MM/yyyy');
      var date1 = inputFormat.parseStrict(str);
      return true;
    } catch (e) {
      print('--- Loi ---');
      return false;
    }
  }

  static Color appbarcolor = Color.fromARGB(255, 3, 136, 244);
  static Color? backgroundcolor = Colors.lightBlue[200];

  static TextStyle textfancyheader1 =
      GoogleFonts.sansitaSwashed(fontSize: 40, color: Colors.white);

  static TextStyle textheader1 = GoogleFonts.sansitaSwashed(
      fontSize: 35, color: Color.fromARGB(255, 235, 225, 225));

  static TextStyle texterror0 = const TextStyle(
      color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic);
  static TextStyle texterror1 = const TextStyle(
      color: Color.fromARGB(255, 255, 0, 0),
      fontSize: 16,
      fontStyle: FontStyle.italic);

  static TextStyle textlink1 = const TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textbody1 =
      const TextStyle(color: Colors.black, fontSize: 18);

  static TextStyle textbodyfocus1 =
      const TextStyle(color: Colors.black, fontSize: 25);
}

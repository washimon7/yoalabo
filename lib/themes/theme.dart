import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YocantoColors {
  static Color black = const Color(0xff04050b);
  static Color white = const Color(0xfffafafb);
  static Color white2 = const Color(0x99fafafb);
  static Color gray = const Color(0xff3d3849);
  static Color bluish = const Color(0xff2320c9);
  static Color pink = const Color(0xffd74467);
}

class LyricColors {
  
  static Color getRandomColor() {
    const List<Color> list = [
      Color(0xffb08968),
      Color(0xffca6702),
      Color(0xff0a9396),
      Color(0xff005f73),
      Color(0xff457b9d),
      Color(0xff1d3557),
      Color(0xff9c6644),
      Color(0xff606c38),
      Color(0xffef476f),
      Color(0xffe76f51),
    ];
    
    const min = 0;
    final max = list.length;
    final randomIndex = min + Random().nextInt(max - min);

    return list.elementAt(randomIndex);
  }
}

final _border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: YocantoColors.gray
  )
);
final _appBarTheme = AppBarTheme(
  color: Colors.transparent,
  elevation: 0,
  titleTextStyle: GoogleFonts.lato().copyWith(
    color: YocantoColors.white,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  )
);

final darkTheme = ThemeData(
  textTheme: GoogleFonts.latoTextTheme().apply(
    displayColor: YocantoColors.white,
    bodyColor: YocantoColors.white
  ),
  colorScheme: ColorScheme.dark(primary: YocantoColors.bluish),
  appBarTheme: _appBarTheme,
  scaffoldBackgroundColor: YocantoColors.black,
  inputDecorationTheme: InputDecorationTheme(
    border: _border,
    enabledBorder: _border,
    focusedBorder: _border,
    hintStyle: GoogleFonts.poppins(color: YocantoColors.white, fontSize: 14),
    labelStyle: TextStyle(
      color: YocantoColors.white
    ),
    floatingLabelStyle: TextStyle(
      color: YocantoColors.white2
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: YocantoColors.gray,
    contentTextStyle: TextStyle(color: YocantoColors.white)
  )
);

// final lightTheme = ThemeData(
//   textTheme: GoogleFonts.latoTextTheme().apply(
//     displayColor: YocantoColors.black,
//     bodyColor: YocantoColors.black,
//   ),
//   colorScheme: ColorScheme.light(primary: YocantoColors.bluish),
//   elevatedButtonTheme: _elevationButtonTheme,
//   appBarTheme: _appBarTheme
// );

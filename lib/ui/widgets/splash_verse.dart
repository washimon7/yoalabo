import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashVerse extends StatelessWidget {
  const SplashVerse({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final verse = [
      'Pero yo cantaré de tu poder,',
      'Y alabaré de mañana tu misericordia;',
      'Porque has sido mi amparo',
      'Y refugio en el día de mi angustia.',
      'Salmos 59:16'
    ];
    final double height = MediaQuery.of(context).size.height;
        
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: verse.map((v) {
            return verse.last == v
            ? Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                v,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  height: 1.3
                ),
              ),
            )
            : Text(
              v,
              style: GoogleFonts.cardoTextTheme().displayLarge?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600
              )
            );
          }).toList()
        ),
      )
    );
  }
}
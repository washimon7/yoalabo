import 'package:flutter/material.dart';

class SplashImage extends StatelessWidget {
const SplashImage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Image.asset(
        'assets/background/aaron-burden-JXX380Eg-RI-unsplash.jpg',
        fit: BoxFit.cover,
        alignment: Alignment.center,
      )
    );
  }
}
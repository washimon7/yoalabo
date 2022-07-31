import 'package:flutter/material.dart';
import 'package:yoalabo/ui/widgets/splash_button.dart';
import 'package:yoalabo/ui/widgets/splash_image.dart';
import 'package:yoalabo/ui/widgets/splash_verse.dart';
import 'package:yoalabo/yoalabo/screens/root_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final double horizontalPadding = 16;

  void navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const RootScreen())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SplashImage(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Yoalabo',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '''Encuentra aquí todos las letras e himnos que canta el Conjunto Coral Fe y Esperanza de la iglesia Progreso de la ciudad de Juliaca, Puno.''',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SplashVerse(),
                  SplashButton(navigationTo: navigateToHome)
                ]
              ),
            ),
          )
        ],
      )
    );
  }
}

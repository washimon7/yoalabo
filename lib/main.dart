import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'package:yoalabo/yoalabo/screens/testing_lrc.dart';
import 'package:yoalabo/yoalabo/screens/ps_and_lyrics_screen.dart';
import 'package:yoalabo/yoalabo/screens/root_screen.dart';
import 'package:yoalabo/themes/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yoalabo',
      theme: darkTheme,
      home: const RootScreen(),
      // initialRoute: RootScreen.routeName,
      // routes: {
      //   RootScreen.routeName: (_) => const RootScreen(),
      //   PsAndLyricsScreen.routeName: (_) => const PsAndLyricsScreen(),
      //   TestingLrc.routeName: (_) => const TestingLrc()
      // },
    );
  }
}

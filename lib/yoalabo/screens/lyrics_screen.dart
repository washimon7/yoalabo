import 'package:flutter/material.dart';
import 'package:yoalabo/yoalabo/screens/screens.dart';

class LyricsScreen extends StatelessWidget {
  const LyricsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: const Icon(Icons.music_note),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const PSRegisterFormScreen())
          );
        },
      ),
    );
  }
}
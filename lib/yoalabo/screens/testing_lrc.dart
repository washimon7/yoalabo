import 'package:flutter/material.dart';
import 'package:lrc/lrc.dart';

class TestingLrc extends StatelessWidget {
  const TestingLrc({ Key? key }) : super(key: key);
  static const routeName = '/testingLrc';

  void printLyrics(Lrc lrc) async {
    await for (LrcStream i in lrc.stream) {
    print('${i.current.lyrics}');
  }
}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing Lrc'),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/lyrics/Coldplay-My-Universe.lrc"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final String lyricsFromFile = snapshot.data.toString();
            final lrc = Lrc.parse(lyricsFromFile);
            // print(lrc.format());
            // print(lrc.lyrics.last.timestamp.toString());
            // LrcLine(timestamp: timestamp, lyrics: lyrics, type: LrcTypes.simple, args: {  });
            // printLyrics(lrc);
          }
          return const Center(
            child: Text('Todo bien')
          );
        },
      )
    );
  }
}

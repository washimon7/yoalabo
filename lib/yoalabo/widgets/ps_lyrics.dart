import 'package:flutter/material.dart';
import 'package:yoalabo/models/lyrics.dart';
// import 'package:yoalabo/models/lyrics.dart';

class PSLyrics extends StatelessWidget {
  PSLyrics({ Key? key, required this.lyrics }) : super(key: key);

  final Lyrics lyrics;
  final Map<String, dynamic> tempLyrics = {
    '12': 'Esta es la historia',
    '13': 'de este mundo.',
    '14': '',
    '15': 'Día alegre nos espera allí',
    '16': 'dia triste nos espera aquí.',
    '17': 'Día alegre nos espera allí',
    '18': 'dia triste nos espera aquí.',
    '19': '',
    '20': 'Esta es la historia',
    '21': 'de este mundo.',
    '22': 'Esta es la historia',
    '23': 'de este mundo.',
    '24': '',
    '25': 'Esta es la historia',
    '26': 'de este mundo.',
    '27': 'Esta es la historia',
    '28': 'de este mundo.',
    '29': '',
    '30': 'Esta es la historia',
    '31': 'de este mundo.',
    '32': 'Esta es la historia',
    '33': 'de este mundo.',
    '34': '',
    '35': 'Esta es la historia',
    '36': 'de este mundo.',
    '37': 'Esta es la historia',
    '38': 'de este mundo.',
    '39': '',
    '40': 'Esta es la historia',
    '41': 'de este mundo.',
    '42': 'Esta es la historia',
    '43': 'de este mundo.',
  };

  @override
  Widget build(BuildContext context){
    /* NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return true;
      }, */
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 24, right: 24, bottom: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: tempLyrics.values.map((lyric) {
            return lyric.toString().isEmpty
              ? const SizedBox(height: 24)
              : Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  lyric,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                  ),
                ),
              );
          }).toList()
        ),
      ),
    );
  }
}

/* class _MelodyIcon extends StatelessWidget {
  const _MelodyIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Icon(Icons.music_note_rounded, size: 14),
      )
    );
  }
} */
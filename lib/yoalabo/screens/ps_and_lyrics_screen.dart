import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoalabo/themes/theme.dart';
import 'package:yoalabo/yoalabo/controllers/ps_lyrics_controller.dart';
import 'package:yoalabo/yoalabo/widgets/ps_lyrics.dart';

class PsAndLyricsScreen extends StatelessWidget {
  const PsAndLyricsScreen({ Key? key }) : super(key: key);
  static const routeName = '/psAndLyrics';

  @override
  Widget build(BuildContext context){
    final psLyricsCtrl = Get.find<PSLyricsController>();

    return Scaffold(
      backgroundColor: LyricColors.getRandomColor(),
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Esta es la historia',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Conjunto Coral Fe y Esperanza',
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                color: YocantoColors.white2
              ),
            )
          ],
        )
      ),
      /* body: Obx(() {
        if (psLyricsCtrl.loading) {
          return const RefreshProgressIndicator();
        }
        if (psLyricsCtrl.errorMsg != '') {
          return Text(psLyricsCtrl.errorMsg);
        }
        if (psLyricsCtrl.notFound != '') {
          return Text(psLyricsCtrl.notFound);
        }
        return PSLyrics(lyrics: psLyricsCtrl.psLyrics);
      }), */
      body: PSLyrics(lyrics: psLyricsCtrl.psLyrics)
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoalabo/models/praise_song.dart';
import 'package:yoalabo/themes/theme.dart';
import 'package:yoalabo/yoalabo/controllers/ps_lyrics_controller.dart';
import 'package:yoalabo/yoalabo/screens/screens.dart';

class RecommendedPraiseSongs extends StatelessWidget {
  const RecommendedPraiseSongs({
    Key? key,
    required this.data
  }) : super(key: key);

  final List<PraiseSong> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Recomendado',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline6?.copyWith(
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 10),
          ...data.map((ps) => _RecommendedPSItem(praiseSong: ps)).toList(),
        ],
      ),
    );
  }
}

class _RecommendedPSItem extends StatelessWidget {
  const _RecommendedPSItem({
    Key? key,
    required this.praiseSong
  }) : super(key: key);

  final PraiseSong praiseSong;

  void navigateToPSAndLyricsScreen(BuildContext context) {
    final psLyricsCtrl = Get.find<PSLyricsController>();
    psLyricsCtrl.loadPSLyrics(praiseSong.lyrics?.uid ?? '');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const PsAndLyricsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => navigateToPSAndLyricsScreen(context),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            height: 75,
            decoration: const BoxDecoration(
              // color: Colors.lightBlue,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: YocantoColors.bluish,
                      borderRadius: const BorderRadius.all(Radius.circular(10))
                    ),
                    child: Image.asset(
                      'assets/yoalabo/no_album_image.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        praiseSong.songName,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Conjunto Coral Fe y Esperanza',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: YocantoColors.white,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Mp3 (pronto)',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                          color: YocantoColors.white2
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 3)
      ],
    );
  }
}
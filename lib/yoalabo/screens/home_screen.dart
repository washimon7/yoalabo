import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoalabo/yoalabo/controllers/yoalabo_controller.dart';
import 'package:yoalabo/yoalabo/widgets/recommended_praise_songs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final yoalaboCtrl = Get.find<YoalaboController>();
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const _CustomAppbar(),
            Obx(() {
              if (yoalaboCtrl.loading) {
                return const RefreshProgressIndicator();
              }
              if (yoalaboCtrl.errorMsg != '') {
                return Text(yoalaboCtrl.errorMsg);
              }
              if (yoalaboCtrl.praiseSongList.isEmpty) {
                return const Text('Todavía no hay cantos.');
              }

              return RecommendedPraiseSongs(data: yoalaboCtrl.praiseSongList);
            })
          ],
        ),
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget {
  const _CustomAppbar({
    Key? key,
  }) : super(key: key);

  Widget getCustomGreet(BuildContext context) {
    var greet = '';
    final currentDT = DateTime.now();
    if (currentDT.hour >= 4 && currentDT.hour < 12) {
      greet = 'Buenos días';
    } else if (currentDT.hour >= 12 && currentDT.hour < 19) {
      greet = 'Buenas tardes';
    } else {
      greet = 'Buenas noches';
    }

    return Text(
      greet,
      style: Theme.of(context).appBarTheme.titleTextStyle
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getCustomGreet(context),
          IconButton(
            icon: const Icon(Icons.update),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
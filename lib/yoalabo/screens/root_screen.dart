import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoalabo/themes/theme.dart';
import 'package:yoalabo/yoalabo/controllers/ps_lyrics_controller.dart';
import 'package:yoalabo/yoalabo/controllers/yoalabo_controller.dart';
import 'package:yoalabo/yoalabo/screens/screens.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({ Key? key }) : super(key: key);

  static const routeName = '/';

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  var _selectedIndex = 0;

  void _changeScreen(int index) {
    setState(() => _selectedIndex = index);
  }

  final List<Widget> _screens =  const [
    HomeScreen(),
    SearchScreen(),
    LyricsScreen(),
    // SettingsScreen()
  ];
  
  @override
  Widget build(BuildContext context){
    Get.put(YoalaboController());
    Get.put(PSLyricsController());
    
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: YocantoColors.pink,
        unselectedItemColor: YocantoColors.white2,
        backgroundColor: YocantoColors.bluish,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: const Icon(Icons.home),
            backgroundColor: YocantoColors.bluish,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: 'Search',
            backgroundColor: YocantoColors.bluish,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.music_note_outlined),
            label: 'Lyrics',
            activeIcon: const Icon(Icons.music_note),
            backgroundColor: YocantoColors.bluish,
          ),
          // BottomNavigationBarItem(
          //   icon: const Icon(Icons.settings_outlined),
          //   label: 'Settings',
          //   activeIcon: const Icon(Icons.settings),
          //   backgroundColor: YocantoColors.bluish,
          // ),
        ],
        currentIndex: _selectedIndex,
        onTap: _changeScreen,
      ),
    );
  }
}

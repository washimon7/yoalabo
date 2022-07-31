import 'package:get/get.dart';
import 'package:yoalabo/models/praise_song.dart';
import 'package:yoalabo/yoalabo/services/praise_song_service.dart';

class YoalaboController extends GetxController {
  YoalaboController() {
    loadRecommendedPS();
  }
  final _loading = false.obs;
  final _praiseSongList = <PraiseSong>[].obs;
  final _errorMsg = ''.obs;

  bool get loading {
    return _loading.value;
  }
  List<PraiseSong> get praiseSongList {
    return [..._praiseSongList];
  }
  String get errorMsg {
    return _errorMsg.value;
  }

  void loadPSList(List<PraiseSong> list) {
    _praiseSongList.value = [...list];
  }
  void setLoading(bool val) {
    _loading.value = val;
  }
  void clearErrorMsg() {
      _errorMsg.value = '';
  }
  void loadRecommendedPS() async {
    setLoading(true);
    final res = await PraiseSongService.fetchRecommendedPS();
    if (res[200] != null) {
      clearErrorMsg();
      loadPSList(res[200]);
    }
    if (res[500] != null) {
      _errorMsg.value = res[500];
    }
    setLoading(false);
  }
}

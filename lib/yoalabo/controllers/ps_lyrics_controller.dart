import 'package:get/state_manager.dart';
import 'package:yoalabo/models/lyrics.dart';
import 'package:yoalabo/yoalabo/services/ps_lyrics_service.dart';

class PSLyricsController extends GetxController {
  final _loading = false.obs;
  final _psLyrics = Lyrics(uid: '', lyrics: {}).obs;
  final _errorMsg = ''.obs;
  final _notFound = ''.obs;

  bool get loading {
    return _loading.value;
  }
  Lyrics get psLyrics {
    return _psLyrics.value;
  }
  String get errorMsg {
    return _errorMsg.value;
  }
  String get notFound {
    return _notFound.value;
  }

  void setLoading(bool val) {
    _loading.value = val;
  }
  void _loadLirycs(Lyrics lyrics) {
    _psLyrics.value = lyrics;
  }
  void _clearErrorMsg() {
      _errorMsg.value = '';
  }
  void _clearNotFound() {
      _notFound.value = '';
  }
  void loadPSLyrics(String idDoc) async {
    if (idDoc.isEmpty) {
      _notFound.value = 'No hay todavía letras para este canto.';
      return;
    }
    setLoading(true);
    final res = await PSLyricsService.fetchPSLyrics(idDoc);
    if (res[200] != null) {
      _clearErrorMsg();
      _clearNotFound();
      _loadLirycs(res[200]);
    }
    if (res[404] != null) {
      _clearErrorMsg();
      _notFound.value = res[404];
    }
    if (res[500] != null) {
      _clearNotFound();
      _errorMsg.value = res[500];
    }
    setLoading(false);
  }
}
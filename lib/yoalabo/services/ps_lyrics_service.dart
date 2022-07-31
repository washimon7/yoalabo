import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoalabo/firebase/firestore.dart';
import 'package:yoalabo/models/lyrics.dart';

class PSLyricsService {
  static Future<Map<int, dynamic>> fetchPSLyrics(String idDoc) async {
    CollectionReference<Map<String, dynamic>> lyrics = firestore.collection('lyrics');
    
    try {
      DocumentSnapshot<Map<String, dynamic>> data = await lyrics.doc(idDoc).get();
      Map<String, dynamic> decodedData = data.data() ?? {};
      if (decodedData.isNotEmpty) {
        Lyrics obj = Lyrics.parse(data.id, decodedData);
        return {
          200: obj
        };
      } else {
        return {
          404: 'No hay todavía letras para este canto.'
        };
      }

    } catch (e) {
      print({"error": e});
      return {
        500: 'Hubo un error.'
      };
    }
  }
}
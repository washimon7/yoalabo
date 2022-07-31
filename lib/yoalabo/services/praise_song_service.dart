// import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoalabo/firebase/firestore.dart';
import 'package:yoalabo/models/lyrics.dart';
import 'package:yoalabo/models/praise_song.dart';

class PraiseSongService {

  static Future<Map<int, dynamic>> fetchRecommendedPS() async {
    CollectionReference<Map<String, dynamic>> praiseSongs = firestore.collection('praiseSongs');

    try {
      QuerySnapshot<Map<String, dynamic>> data = await praiseSongs.get();
      List<PraiseSong> list = data.docs.map((ps) {
        final decodedData = ps.data();
        decodedData.addEntries({'uid': ps.id}.entries);
        decodedData['lyrics'] = decodedData['lyrics'] == null
          ? null 
          : Lyrics(uid: decodedData['lyrics']);
        // print(decodedData);

        return PraiseSong.parse(decodedData);
      }).toList();
      final mappedList = {
        200: list
      };
      // await Future.delayed(const Duration(milliseconds: 400));
      
      return mappedList;
    } catch (e) {
      print({"error": e});
      return {
        500: 'Ocurrió un error.'
      };
    }
  }

  static Future<Map<int, dynamic>> fetchCreatePS(PraiseSong obj) async {
    CollectionReference<Map<String, dynamic>> praiseSongs = firestore.collection('praiseSongs');

    try {
      final res = await praiseSongs.add(obj.parseToMap());
      print({"id": res.id});
      return {
        200: res.id
      };
    } catch (e) {
      print({"error": e});
      return {
        500: 'Hubo un error'
      };
    }
  }
}
import "package:cloud_firestore/cloud_firestore.dart";
import "package:yoalabo/models/lyrics.dart";

class PraiseSong {
  PraiseSong({
    this.uid,
    required this.songName,
    this.lyrics,
    this.album,
    this.choralEnsembleName,
    required this.createdAt,
  });

  final String? uid;
  final String songName;
  final Lyrics? lyrics;
  final String? album;
  final String? choralEnsembleName;
  final Timestamp createdAt;

  factory PraiseSong.parse(Map<String, dynamic> json) => PraiseSong(
    uid: json["uid"],
    songName: json["songName"],
    // lyrics: json["lyrics"] == null ? null : json["lyrics"],
    lyrics: json["lyrics"],
    // album: json["album"] == null ? null : json["album"],
    album: json["album"],
    // choralEnsembleName: json["album"] == null ? null : json["album"],
    choralEnsembleName: json["album"],
    createdAt: json["createdAt"]
  );
  Map<String, dynamic> parseToMap() {
    return {
      "songName": songName,
      "createdAt": createdAt
    };
  }
}

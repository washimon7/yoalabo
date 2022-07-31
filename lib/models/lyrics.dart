class Lyrics {
  Lyrics({
    required this.uid,
    this.lyrics,
  });

  String uid;
  Map<String, dynamic>? lyrics;

  factory Lyrics.parse(String uid, Map<String, dynamic> data) => Lyrics(
    uid: uid,
    lyrics: data,
  );
}
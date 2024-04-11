class BhagvatGeeta {
  final int id;
  final int chapterId;
  final String chapterNameEg;
  final String chapterNameHn;
  final String image;
  final int totalVerse;
  final List<Verse> verses;

  BhagvatGeeta({
    required this.id,
    required this.chapterId,
    required this.chapterNameEg,
    required this.chapterNameHn,
    required this.image,
    required this.totalVerse,
    required this.verses,
  });

  factory BhagvatGeeta.fromJson(Map<String, dynamic> json) => BhagvatGeeta(
    id: json["id"],
    chapterId: json["chapter_id"],
    chapterNameEg: json["chapter_name_eg"],
    chapterNameHn: json["chapter_name_hn"],
    image: json["image"],
    totalVerse: json["total_verse"],
    verses: List<Verse>.from(json["verses"].map((x) => Verse.fromJson(x))),
  );

}




class Verse {
  final double verseId;
  final String verse;
  final String commentaryEg;
  final String commentaryHn;

  Verse({
    required this.verseId,
    required this.verse,
    required this.commentaryEg,
    required this.commentaryHn,
  });

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
    verseId: json["verse_id"],
    verse: json["verse"],
    commentaryEg: json["commentary_eg"],
    commentaryHn: json["commentary_hn"],
  );


}

class BookMark{

  final String? slock;
  BookMark( {required this.slock});
}


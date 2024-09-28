/// adult : false
/// backdrop_path : null
/// genre_ids : [18]
/// id : 396316
/// original_language : "fr"
/// original_title : "L'Occitanienne"
/// overview : "One stormy evening in 1829, the aging writer René de Chateaubriand, takes refuge in a mountain retreat at Cauterets, a small town in the Pyrenees. Here, he meets Léontine de Villeneuve, an aristocratic woman forty years his junior, who ignites his passion and who seems to be as equally attracted to him. Under the watchful gaze of the maître d'hôtel, Chateaubriand embarks on what will be his last great love affair, with a woman he will later refer to in his writings as L'Occitanienne."
/// popularity : 1.927
/// poster_path : "/uR9GsZvAWmZYpeYS8C6mpLsxpfj.jpg"
/// release_date : "2008-03-19"
/// title : "Chateaubriand's Last Love"
/// video : false
/// vote_average : 0.0
/// vote_count : 0
class Results {
  Results({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Results.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? List<num>.from(json['genre_ids']) : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  bool? adult;
  dynamic backdropPath;
  List<num>? genreIds;
  num? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }
}

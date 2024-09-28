import 'package:movies_app/api/model/Movie.dart';

import 'Geners.dart';
import 'ProductionCompanies.dart';
import 'ProductionCountries.dart';
import 'SpokenLanguages.dart';

/// adult : false
/// backdrop_path : "/xJHokMbljvjADYdit5fK5VQsXEG.jpg"
/// belongs_to_collection : null
/// budget : 165000000
/// genres : [{"id":12,"name":"Adventure"},{"id":18,"name":"Drama"},{"id":878,"name":"Science Fiction"}]
/// homepage : "http://www.interstellarmovie.net/"
/// id : 157336
/// imdb_id : "tt0816692"
/// origin_country : ["US"]
/// original_language : "en"
/// original_title : "Interstellar"
/// overview : "The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage."
/// popularity : 202.763
/// poster_path : "/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg"
/// production_companies : [{"id":923,"logo_path":"/8M99Dkt23MjQMTTWukq4m5XsEuo.png","name":"Legendary Pictures","origin_country":"US"},{"id":9996,"logo_path":"/3tvBqYsBhxWeHlu62SIJ1el93O7.png","name":"Syncopy","origin_country":"GB"},{"id":13769,"logo_path":null,"name":"Lynda Obst Productions","origin_country":"US"}]
/// production_countries : [{"iso_3166_1":"GB","name":"United Kingdom"},{"iso_3166_1":"US","name":"United States of America"}]
/// release_date : "2014-11-05"
/// revenue : 701729206
/// runtime : 169
/// spoken_languages : [{"english_name":"English","iso_639_1":"en","name":"English"}]
/// status : "Released"
/// tagline : "Mankind was born on Earth. It was never meant to die here."
/// title : "Interstellar"
/// video : false
/// vote_average : 8.44
/// vote_count : 35215

class DetailsResponse {
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  num? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  bool? success;
  int? statusCode;
  String? statusMessage;

  DetailsResponse({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.success,
    this.statusCode,
    this.statusMessage,
  });

  // Factory constructor to initialize from JSON
  factory DetailsResponse.fromJson(Map<String, dynamic> json) {
    return DetailsResponse(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      belongsToCollection: json['belongs_to_collection'],
      budget: json['budget'],
      genres: (json['genres'] as List<dynamic>?)
          ?.map((item) => Genres.fromJson(item))
          .toList(),
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: (json['popularity'] as num?)?.toDouble(),  // Ensuring correct type
      posterPath: json['poster_path'],
      productionCompanies: (json['production_companies'] as List<dynamic>?)
          ?.map((item) => ProductionCompanies.fromJson(item))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>?)
          ?.map((item) => ProductionCountries.fromJson(item))
          .toList(),
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
          ?.map((item) => SpokenLanguages.fromJson(item))
          .toList(),
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'],
      success: json['success'],
      statusCode: json['status_code'],
      statusMessage: json['status_message'],
    );
  }

  // Convert the object back to JSON format
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['belongs_to_collection'] = belongsToCollection;
    data['budget'] = budget;
    if (genres != null) {
      data['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    data['homepage'] = homepage;
    data['id'] = id;
    data['imdb_id'] = imdbId;
    data['origin_country'] = originCountry;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    if (productionCompanies != null) {
      data['production_companies'] = productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      data['production_countries'] = productionCountries?.map((v) => v.toJson()).toList();
    }
    data['release_date'] = releaseDate;
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    if (spokenLanguages != null) {
      data['spoken_languages'] = spokenLanguages?.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['tagline'] = tagline;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['success'] = success;
    data['status_code'] = statusCode;
    data['status_message'] = statusMessage;
    return data;
  }
}

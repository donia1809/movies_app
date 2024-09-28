import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/api/details_model/DetailsResponse.dart';
import 'package:movies_app/api/model/NewReleasesResponse.dart';
import 'package:movies_app/api/model/PopularMoviesResponse.dart';
import 'package:movies_app/api/model/RecommendedMoviesResponse.dart';
import 'package:movies_app/api/similar_model/SimilarResponse.dart';
import 'model/Search_response.dart';

class Endpoints {
  static const String popular = '3/movie/popular';
  static const String newReleases = '3/movie/upcoming';
  static const String recommended = '3/movie/top_rated';
  static const String search = '3/search/movie';
  // static const String details = '3/movie/;

}

///////////////////////////////
class ApiManager {
  static const String BASE_URl = 'api.themoviedb.org';
  static const String Authorization_Key =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZmY5NjQxZTkzMDIyMTEzZGVmYzAyYmM4ZmE5YTFjZCIsIm5iZiI6MTcyNjU5OTg4Ny41MDc0OSwic3ViIjoiNjZlOWQxZjk4MmZmODczZjdkMWVlOGJhIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.Oha5G0MpPKfKbtTrD-XBlva3T3f1CS_Qv4HH86DuVr8'; //mohammed
  static const String apiKey = 'e355dd58de7cceb8c05964a6d8fe643e'; //donia

  static Future<PopularMoviesResponse> getPopularMovies() async {
    var url = Uri.https(BASE_URl, Endpoints.popular);
    var response =
        await http.get(url, headers: {'Authorization': Authorization_Key});
    var json = jsonDecode(response.body);
    var Popularmovies = PopularMoviesResponse.fromJson(json);
    return Popularmovies;
  }

  /////New Release
  static Future<NewReleasesResponse> getNewReleases() async {
    var url = Uri.https(BASE_URl, Endpoints.newReleases);
    var response =
        await http.get(url, headers: {'Authorization': Authorization_Key});
    var json = jsonDecode(response.body);
    var newReleases = NewReleasesResponse.fromJson(json);
    return newReleases;
  }

  /////Recommended
  static Future<RecommendedMoviesResponse> getRecommended() async {
    var url = Uri.https(BASE_URl, Endpoints.recommended);
    var response =
        await http.get(url, headers: {'Authorization': Authorization_Key});
    var json = jsonDecode(response.body);
    var recommended = RecommendedMoviesResponse.fromJson(json);
    return recommended;
  }

  /////Search
  static Future<SearchResponse> search(String query) async {
   try {
     var url = Uri.https(
         BASE_URl,
         Endpoints.search,
         { "api_key": apiKey, "query": query}
     );
     var response = await http.get(url);
     if (response.statusCode == 200) {
       var json = jsonDecode(response.body);
       var search = SearchResponse.fromJson(json);
       return search;
     } else {
       throw Exception('Failed to load movies');
     }
   }catch (e) {
    print('Error in search API: $e');
    rethrow;
  }
}

  /////Details
  static Future<DetailsResponse> getDetails(int movieId) async {
    try {
      var url = Uri.https(
        BASE_URl,
        '/3/movie/$movieId',
        {"api_key": apiKey},
      );
      print('API URL: $url');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        print("JSON Response: $json");

        var details = DetailsResponse.fromJson(json);
        return details;
      } else {
        print('Error: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to load movie details. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in fetching movie details: $e');
      throw Exception('Error in fetching movie details: $e');
    }
  }

  /////Similar
  static Future<SimilarResponse> getSimilar(int movieId) async {
    try {
      var url = Uri.https(
        BASE_URl,
        '/3/movie/$movieId/similar',
        {"api_key": apiKey},
      );
      print('API URL: $url');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        print("JSON Response: $json");
        var similar = SimilarResponse.fromJson(json);
        return similar;
      } else {
        print('Error: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to load movie details. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in fetching movie details: $e');
      throw Exception('Error in fetching movie details: $e');
    }
  }


}

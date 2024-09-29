import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/api/category_model/movies_details_response.dart';
import 'package:movies_app/api/details_model/details_response.dart';
import 'package:movies_app/api/model/new_releases_response.dart';
import 'package:movies_app/api/model/popular_movies_response.dart';
import 'package:movies_app/api/model/recommended_movies_response.dart';
import 'package:movies_app/api/similar_model/similar_response.dart';
import 'category_model/movies_list_response.dart';
import 'search_response.dart';

class Endpoints
{
  static const String popular = '3/movie/popular';
  static const String newReleases = '3/movie/upcoming';
  static const String recommended = '3/movie/top_rated';
  static const String search = '3/search/movie';
  static const String moviesList = '3/genre/movie/list';
  static const String moviesDetails = '3/discover/movie';

}

///////////////////////////////
class ApiManager
{
  static const String baseUrl = 'api.themoviedb.org';
  static const String authorizationKey =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZmY5NjQxZTkzMDIyMTEzZGVmYzAyYmM4ZmE5YTFjZCIsIm5iZiI6MTcyNjU5OTg4Ny41MDc0OSwic3ViIjoiNjZlOWQxZjk4MmZmODczZjdkMWVlOGJhIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.Oha5G0MpPKfKbtTrD-XBlva3T3f1CS_Qv4HH86DuVr8'; //mohammed
  static const String apiKey = 'e355dd58de7cceb8c05964a6d8fe643e'; //donia
  static const String authorizationKey2 =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMWVkOTU0NjRkZjBkODEyM2MwYTEyMmNmNDM1MmViMyIsIm5iZiI6MTcyNzIwMjc4Mi4wNTIwOTgsInN1YiI6IjY2ZjE3NjYwZGUyZDUyZGZiZDhkMmMyNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2Q-pbwi-QEKEGmX4oyABVbSX095JMjIY6NArJDU1FqA' ";//mai

  /////Popular
  static Future<PopularMoviesResponse> getPopularMovies() async {
    var url = Uri.https(baseUrl, Endpoints.popular);
    var response =
        await http.get(url, headers: {'Authorization': authorizationKey});
    var json = jsonDecode(response.body);
    var popularMovies = PopularMoviesResponse.fromJson(json);
    return popularMovies;
  }

  /////New Release
  static Future<NewReleasesResponse> getNewReleases() async {
    var url = Uri.https(baseUrl, Endpoints.newReleases);
    var response =
        await http.get(url, headers: {'Authorization': authorizationKey});
    var json = jsonDecode(response.body);
    var newReleases = NewReleasesResponse.fromJson(json);
    return newReleases;
  }

  /////Recommended
  static Future<RecommendedMoviesResponse> getRecommended() async {
    var url = Uri.https(baseUrl, Endpoints.recommended);
    var response =
        await http.get(url, headers: {'Authorization': authorizationKey});
    var json = jsonDecode(response.body);
    var recommended = RecommendedMoviesResponse.fromJson(json);
    return recommended;
  }

  /////Search
  static Future<SearchResponse> search(String query) async {
   try {
     var url = Uri.https(
         baseUrl,
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
        baseUrl,
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
        baseUrl,
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
  static Future<MoviesDetails> getMoviesDetails(String genreId) async {
    try {
      var url = Uri.https(baseUrl, Endpoints.moviesDetails, {'with_genres': genreId}); // Change 'Id' to 'with_genres'
      var response = await http.get(url, headers: {'Authorization': authorizationKey2});
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        var movieDetails = MoviesDetails.fromJson(jsonResponse);
        return movieDetails;
      } else {
        throw Exception('Failed to load movies: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      print('Error in search API: $e');
      rethrow;
    }
  }

  static Future<MoviesListResponse> getMoviesList() async {
    try {
      // Correctly build the URL with scheme
      var url = Uri.https(baseUrl, Endpoints.moviesList);
      var response = await http.get(url, headers: {'Authorization': authorizationKey2});

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var moviesList = MoviesListResponse.fromJson(json);
        return moviesList;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      print('Error in MoviesList API: $e');
      rethrow;
    }
  }

}

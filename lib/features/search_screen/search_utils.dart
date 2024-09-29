import '../../api/api_manager.dart';
import '../../api/search_response.dart';

class SearchAboutMovie {
  static Future<SearchResponse> searchMovies(String query) {
    return ApiManager.search(query);
  }
}
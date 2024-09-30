import '../../api/api_manager.dart';
import '../../api/model/search_response.dart';

class SearchAboutMovie {
  static Future<SearchResponse> searchMovies(String query) {
    return ApiManager.search(query);
  }
}
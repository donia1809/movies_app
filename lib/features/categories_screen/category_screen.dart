import 'package:flutter/material.dart';
import 'package:movies_app/features/categories_screen/movies_screen.dart';
import 'package:movies_app/api/api_manager.dart';
import '../../api/model/category_model/movies_list_response.dart';
import '../../api/model/genres.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/text_style.dart';

class CategoryScreen extends StatefulWidget {
  static const String routeName = 'category_screen';
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Genres> genres = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchGenres();
  }

  Future<void> fetchGenres() async {
    try {
      MoviesListResponse response = await ApiManager.getMoviesList(); // No need to pass Id and name

      setState(() {
        genres = response.genres ?? [];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching genres: $e');
    }
  }

  void navigateToMovies(String genreId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MoviesScreen(genreId: genreId)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Browse Category",
            style: TextStyleApp.font22BoldColorWhite,
          ),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator(color: AppColors.white))
                : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
              ),
              itemCount: genres.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    navigateToMovies(genres[index].id.toString()); // Use genre ID here
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black,
                          blurRadius: 6.0,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            "assets/images/cinema.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text( genres[index].name ?? "", style: TextStyle(color: AppColors.white),),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:movies_app/api/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/important_url.dart';
import 'package:movies_app/core/theming/text_style.dart';
import '../../api/category_model/movies_details_response.dart';
import '../../core/theming/colors.dart';
import '../home_screen/movies_details/movies_details.dart';
class MoviesScreen extends StatelessWidget {
  final String genreId;

  const MoviesScreen({super.key,required this.genreId});

  get movie => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        title: Text(
          "All Movies",
          style: TextStyleApp.font22BoldColorWhite,
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: FutureBuilder<MoviesDetails>(
                future: ApiManager.getMoviesDetails(genreId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final movies = snapshot.data?.results ?? [];
                    return ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                            child: InkWell( onTap: () {
                              if (movie?.id != null) {
                                Navigator.pushNamed(
                                  context,
                                  MoviesDetailsWidget.routeName,
                                  arguments: {'movieId': movie?.id},
                                );
                              }
                            },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  ImportantUrl.baseImageUrl + movie.posterPath!,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Center(
                                        child:
                                            Icon(Icons.error, color: AppColors.red));
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text('No movies found',
                    style: TextStyleApp.font14weight400colorWhite,));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

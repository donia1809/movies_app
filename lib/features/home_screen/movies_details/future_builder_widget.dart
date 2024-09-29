import 'package:flutter/material.dart';
import 'package:movies_app/features/home_screen/movies_details/similar_movie_widget.dart';

import '../../../api/api_manager.dart';
import '../../../api/details_model/details_response.dart';
import '../../../api/model/movie.dart';
import '../../../api/similar_model/similar_response.dart';
import '../../../core/theming/colors.dart';
import 'details.dart';

class FutureBuilderWidget extends StatelessWidget
{
  final Movie? movie;

  const FutureBuilderWidget({super.key , this.movie});

  @override
  Widget build(BuildContext context)
  {
    final arguments =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (arguments == null || !arguments.containsKey('movieId')) {
      return const Center(child: Text('Invalid movie ID'));
    }
    final int movieId = arguments['movieId'];
    print('movieId: $movieId');

   return  FutureBuilder(
     future: Future.wait([
       ApiManager.getDetails(movieId),
       ApiManager.getSimilar(movieId),
     ]),
     builder: (context, snapshot) {
       if (snapshot.connectionState == ConnectionState.waiting) {
         return const Center(
           child: CircularProgressIndicator(),
         );
       }
       if (snapshot.hasError) {
         return Center(
           child: Text(
             'Something went wrong',
             style: TextStyle(color: AppColors.white),
           ),
         );
       }
       final details = snapshot.data?[0] as DetailsResponse?;
       final similarResponse = snapshot.data?[1] as SimilarResponse?;

       if (details == null || similarResponse == null) {
         return Center(
           child: Text(
             'No details or similar movies available',
             style: TextStyle(color: AppColors.white),
           ),
         );
       }
       return SingleChildScrollView(
         child: Column(
           children: [
             DetailsWidget(details: details),
             SimilarMovieWidget(similarMovies: similarResponse.results ?? []),
           ],
         ),
       );
     },
   );
  }

}
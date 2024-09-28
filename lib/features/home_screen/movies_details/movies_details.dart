import 'package:flutter/material.dart';
import 'package:movies_app/api/model/Movie.dart';
import 'package:movies_app/features/home_screen/movies_details/future_builder_widget.dart';
import 'package:movies_app/features/home_screen/movies_details/similar_movie_widget.dart';
import '../../../api/apimanager.dart';
import '../../../api/details_model/DetailsResponse.dart';
import '../../../api/similar_model/SimilarResponse.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/text_style.dart';
import 'details.dart';

class MoviesDetails extends StatelessWidget {
  static const routeName = 'details';
  final Movie? movie;

  MoviesDetails({super.key, this.movie});

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
          'Movie Details',
          style: TextStyleApp.font14weight400colorWhite,
        ),
      ),
      body:  FutureBuilderWidget(),
    );
  }
}

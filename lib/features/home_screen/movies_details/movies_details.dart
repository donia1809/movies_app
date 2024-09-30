import 'package:flutter/material.dart';
import 'package:movies_app/features/home_screen/movies_details/future_builder_widget.dart';
import '../../../api/model/details_model/details_response.dart';
import '../../../api/model/home_model/movie.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/text_style.dart';

class MoviesDetailsWidget extends StatelessWidget {
  static const routeName = 'details';
  final DetailsResponse? details;
  Movie?movie;
   MoviesDetailsWidget({super.key, this.details,this.movie});

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
      body:  const FutureBuilderWidget(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_app/api/model/movie.dart';
import 'package:movies_app/features/home_screen/movies_details/future_builder_widget.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/text_style.dart';

class MoviesDetailsWidget extends StatelessWidget {
  static const routeName = 'details';
  final Movie? movie;

  const MoviesDetailsWidget({super.key, this.movie});

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

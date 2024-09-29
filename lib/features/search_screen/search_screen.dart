import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/theming/colors.dart';
import 'package:movies_app/features/search_screen/search_result.dart';
import 'package:movies_app/features/search_screen/search_result_widget.dart';
import 'package:movies_app/features/search_screen/text_field_widget.dart';
import 'package:movies_app/features/search_screen/search_utils.dart';
import '../../api/search_response.dart';
import '../../core/theming/text_style.dart';
import '../home_screen/movies_details/movies_details.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search';
    const SearchScreen({super.key });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  Future<SearchResponse>? searchResults;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      searchMovies(controller.text);
    });
  }

  void searchMovies(String query) {
    if (query.isEmpty) return;
    setState(() {
      searchResults = SearchAboutMovie.searchMovies(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
      child: Column(
        children: [
          TextFieldWidget(
            controller: controller,
            onSearch: searchMovies,
          ),
          // SizedBox(height: 5.h),
          Expanded(
              child: FutureBuilder<SearchResponse?>(
                  future: searchResults,
                  builder: (context, snapshot) {
                    //waiting
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    //error
                    if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        'Something went wrong & error: ${snapshot.error}',
                        style: const TextStyle(color: Colors.white),
                      ));
                    }
                    //no movie
                    if (!snapshot.hasData || snapshot.data!.results == null || snapshot.data!.results!.isEmpty)
                    {
                      return SearchResult();
                    }
                    //has data
                    return ListView.separated(
                        itemCount: snapshot.data!.results!.length,
                        itemBuilder: (context, index) {
                          final movie = snapshot.data!.results![index];
                           return Container(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, MoviesDetailsWidget.routeName,
                                 arguments: {'movieId': movie?.id},);
                              },
                              child: Row(
                                children: [
                                  const SearchResultWidget()
                                  ,SizedBox(width: 10.w)
                                  ,Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(movie?.title??'no title founded',
                                          style: TextStyleApp.font14weight400colorWhite,),
                                        SizedBox(width: 10.w),
                                        Text( movie?.releaseDate??'no date founded',
                                          style: TextStyleApp.font14weight400colorWhite.copyWith(color:Colors.white.withOpacity(.67)),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }, separatorBuilder: (BuildContext context, int index) =>
                           Divider(thickness:1 , color: AppColors.grey3,)
                    );
                  }))
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

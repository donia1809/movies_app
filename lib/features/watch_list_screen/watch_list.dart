import 'package:flutter/material.dart';
import 'package:movies_app/api/model/Movie.dart';
import 'package:movies_app/core/theming/colors.dart';
import 'package:movies_app/features/watch_list_screen/watch_list_card.dart';

import '../../firebase/MovieCollection.dart';

class WatchListScreen extends StatefulWidget
{
  static const String routeName = 'watch_list';

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('WatchList',style: TextStyle(color: Colors.white),),
      ),
      body: StreamBuilder(stream: listenToWatchList(), builder:
    (context, snapshot) {
      if(snapshot.hasError){
        return Center(
          child:Column(
            children: [
              Text('Something went wrong'),
              ElevatedButton(onPressed: () {
                setState(() {

                });
              }, child: Text('Try again'))
            ],
          ) ,
        );
      }if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);

      }
    var  movies = snapshot.data?.docs.map((doc) => doc.data()).toList();
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.separated(
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider( height: 1,color: AppColors.grey3,),
            ),
          itemCount: movies!.length,
              itemBuilder:(context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: WatchListCard(
                           movie: movies![index],

                             ),
              );
              },
              ),
        );
    },)
    );
  }
}
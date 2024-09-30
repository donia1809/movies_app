import 'package:cloud_firestore/cloud_firestore.dart';
import '../api/model/home_model/movie.dart';


  CollectionReference<Movie>getMovieCollection(){
    var  db = FirebaseFirestore.instance;
    return db.collection('movies')
        .withConverter(fromFirestore: (snapshot, options) {
      return Movie.fromfirestore(snapshot.data());
    },
      toFirestore: (value, options) {
        return value.toFieStore();
      },);
  }
  Future<void>  addMovieToWatchList(Movie movie){
     return getMovieCollection().doc(movie.id.toString()).set(movie);

    }
    updateMovie(Movie movie){
    var docRef=getMovieCollection().doc(movie.id.toString());
    docRef.update({'watchLater':true
    });
    }
Stream<QuerySnapshot<Movie>>  listenToWatchList()async*{
  yield* getMovieCollection().
  where('watchLater',isEqualTo:true).
  snapshots();

}

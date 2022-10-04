import 'package:movieapp/models/movie.dart';

abstract class MovieRepository {
  Future<Movies> getMovies();
}

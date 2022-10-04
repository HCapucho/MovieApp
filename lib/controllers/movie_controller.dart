import 'package:flutter/cupertino.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/repositories/movie_repository.dart';

class MovieController {
  final MovieRepository _movieRepository;

  MovieController(this._movieRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);

  fetch() async {
    movies.value = await _movieRepository.getMovies();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/repositories/movie_repository.dart';

class MovieController {
  final MovieRepository _movieRepository;

  MovieController(this._movieRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);
  Movies? _cachedMovies;

  onChanged(String value) {
    List<Movie> list = _cachedMovies!.listMovies
        .where((e) => e.toString().toLowerCase().contains(value.toLowerCase()))
        .toList();
    movies.value = movies.value!.copyWith(listMovies: list);
    return list;
  }

  fetch() async {
    movies.value = await _movieRepository.getMovies();
    _cachedMovies = movies.value;
  }
}

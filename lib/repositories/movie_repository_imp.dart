import 'package:movieapp/models/movie.dart';
import 'package:movieapp/repositories/movie_repository.dart';
import 'package:movieapp/services/dio_service.dart';
import 'package:movieapp/utils/apis.utils.dart';

class MovieRepositoryImp implements MovieRepository {
  final DioService _dioService;

  MovieRepositoryImp(this._dioService);

  @override
  Future<Movies> getMovies() async {
    var result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
    return Movies.fromJson(result.data);
  }
}

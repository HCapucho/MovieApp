import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:movieapp/services/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-Type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlM2QwODM0NGIxZmY3MDI1ZGYxNDdjNTkxMjAxNWEzYiIsInN1YiI6IjYzMDY4NGZiOWE2NGMxMDA3ZDgxNDg0MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3oH0qUn60DTtvUxFJlZFkMMJFg4NsJJ-3JmUYyGDc7U'
        },
      ),
    );
  }
}

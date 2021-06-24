import 'package:omdb_api_bloc/data/models/movie.dart';
import 'package:omdb_api_bloc/data/network_service.dart';

class Repository {

  final NetworkService networkService;

  Repository({required this.networkService});

  Future<List<Movie>> fetchMovies(String movie) async {
    final moviesRaw = await networkService.fetchMovies(movie);
    return moviesRaw.map((e) => Movie.fromJson(e)).toList();
  }
  Future<Movie> fetchMovieById(String omdbId) async {
    final movieRaw = await networkService.fetchMovieByImdbId(omdbId);
    return movieRaw;
  }

}
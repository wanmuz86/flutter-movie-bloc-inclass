import 'package:omdb_api_bloc/data/repository.dart';
import 'package:omdb_api_bloc/cubit/movie_cubit.dart';
import 'package:omdb_api_bloc/data/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omdb_api_bloc/presentation/screens/home.dart';
import 'package:omdb_api_bloc/data/models/movie.dart';
import 'package:omdb_api_bloc/presentation/screens/detail.dart';
class AppRouter {
late Repository repository;
late MovieCubit movieCubit;

AppRouter() {
  repository = Repository(networkService: NetworkService());
  movieCubit = MovieCubit(repository: repository);
}
Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: movieCubit,
          child: HomePage(),
        ),
      );
  case "/detail":
    final movie = settings.arguments as Movie;
    return MaterialPageRoute(
      builder: (_) =>  BlocProvider.value(
        value: movieCubit,
        child: DetailPage(),
      ),
    );
    default:
      return null;
  }
}
}
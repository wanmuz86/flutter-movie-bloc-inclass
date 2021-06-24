import 'dart:async';

import 'package:omdb_api_bloc/data/models/movie.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:omdb_api_bloc/data/repository.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState>{
  final Repository repository;

  MovieCubit({required this.repository}) : super(MoviesInitial());

  void initializePage(){
    emit(MoviesInitial());
  }

  void fetchMovies(String movie){
    emit(MoviesLoading());
    Timer(Duration(seconds:3),(){
      repository.fetchMovies(movie).then((movies){
        emit(MoviesLoaded(movies:movies));
      }).catchError((onError){
        emit(MoviesError(message:onError.toString()));
      });
    });
  }
}
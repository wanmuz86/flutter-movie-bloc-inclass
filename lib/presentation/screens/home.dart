import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omdb_api_bloc/cubit/movie_cubit.dart';
import 'package:omdb_api_bloc/data/models/movie.dart';
class HomePage extends StatelessWidget {
  var movieEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MovieCubit>(context).initializePage();

    return Scaffold(
        appBar: AppBar(title: Text("Home"),),
        body:
            BlocBuilder<MovieCubit, MovieState>(
                builder: (context, state) {
                  if (state is MoviesInitial) {
                    return generateSearchBar(context);
                  }
                  else if (state is MoviesLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  else if (state is MoviesLoaded) {
                    final movies = (state as MoviesLoaded).movies;
                    return Column(
                      children: [
                        generateSearchBar(context),
                         generateListView(movies)
                      ],
                    );

                  }
                  else {
                    final message = (state as MoviesError).message;
                    return Center(child: Text(message),);
                  }
                }),


    );
  }

  Row generateSearchBar(context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: movieEditingController,
            decoration:
          InputDecoration(hintText: "Search new movie"),),
        ),
        TextButton(onPressed: (){
          BlocProvider.of<MovieCubit>(context).fetchMovies(movieEditingController.text!);
        }, child: Text("Search a movie"))
      ],
    );
  }

  Expanded generateListView(List<Movie> movies) {
    return Expanded(
    child:
      ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, position) {
          return ListTile(
            title: Text(movies[position].title),
            subtitle: Text(movies[position].year),
            leading: Image.network(movies[position].poster),
          );
        })
    );
  }
}

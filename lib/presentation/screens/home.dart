import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omdb_api_bloc/cubit/movie_cubit.dart';
import 'package:omdb_api_bloc/data/models/movie.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    BlocProvider.of<MovieCubit>(context).initializePage();

    return Scaffold(
        appBar: AppBar(title: Text("Home"),),
        body: Column(
          children: [

            BlocBuilder<MovieCubit, MovieState>(
                builder: (context, state) {
                  if (state is MoviesInitial) {
                    return generateSearchBar();
                  }
                  else if (state is MoviesLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  else if (state is MoviesLoaded) {
                    final movies = (state as MoviesLoaded).movies;
                    return Column(
                      children: [
                        generateSearchBar(),
                        Expanded(child: generateListView(movies))
                      ],
                    );
                  
                  }
                  else {
                    final message = (state as MoviesError).message;
                    return Center(child: Text(message),);
                  }
                }),
          ],
        )
    );
  }

  Row generateSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(decoration:
          InputDecoration(hintText: "Search new movie"),),
        ),
        TextButton(onPressed: (){
    
        }, child: Text("Search a movie"))
      ],
    );
  }

  ListView generateListView(List<Movie> movies) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, position) {
          return ListTile(
            title: Text(movies[position].title),
            subtitle: Text(movies[position].year),
            leading: Image.network(movies[position].poster),
          );
        });
  }
}

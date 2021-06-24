class MovieDetail {
  final String title;
  final String year;
  final String imdbId;
  final String type;
  final String poster;
  final String genre;
  final String director;
  final String actors;
  final String plot;
  final String released;
// Initializer // Constructor
  MovieDetail({required this.title, required this.year,
    required this.imdbId, required this.type,
    required this.poster, required this.genre, required this.director,
    required this.actors,
    required this.plot, required this.released});

  // Transform json to Class
  // another initializer... but using different format, (according to GoF Best practice)
  // hence the keyword factory is added
  factory MovieDetail.fromJson(Map<String, dynamic> json){
    return MovieDetail(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: json["Type"],
        poster: json["Poster"],
        genre:json["Genre"],
        director: json["Director"],
        actors: json["Actors"],
        plot:json["Plot"],
        released:json["Released"]
    );
  }

}
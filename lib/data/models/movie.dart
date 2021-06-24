class Movie {
  final String title;
  final String year;
  final String imdbId;
  final String type;
  final String poster;

// Initializer // Constructor
  Movie({required this.title, required this.year,
    required this.imdbId, required this.type, required this.poster
  });

  // Transform json to Class
  // another initializer... but using different format, (according to GoF Best practice)
  // hence the keyword factory is added
  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: json["Type"],
        poster:json["Poster"]

    );
  }

}
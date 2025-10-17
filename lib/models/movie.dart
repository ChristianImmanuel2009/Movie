class MovieModel {
  int id;
  String title;
  String overview;
  double? voteAverage;
  String posterPath;
  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    this.voteAverage,
    required this.posterPath,
  });
}

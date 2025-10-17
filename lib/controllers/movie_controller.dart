import 'package:models/models/movie.dart';

class MovieController {
  final List<MovieModel> movies = [
    MovieModel(
      id: 1,
      title: "Superman Come back",
      voteAverage: 9.9,
      overview: "This is the story of Superman who comes back to save the world from doom.",
      posterPath: "https://m.media-amazon.com/images/M/MV5BOGMwZGJiM2EtMzEwZC00YTYzLWIxNzYtMmJmZWNlZjgxZTMwXkEyXkFqcGc@._V1_.jpg",
    ),
    MovieModel(
      id: 2,
      title: "Batman loose again",
      overview: "This is the story of Batman who lost his way and found it again.",
      voteAverage: 9.5,
      posterPath: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Batman_%28black_background%29.jpg/250px-Batman_%28black_background%29.jpg",
    ),
    MovieModel(
      id: 3,
      title: "McQueen 95",
      overview: "This is the story of McQueen who lived his life to the fullest before his untimely death at the age of 95.",
      voteAverage: 8.5,
      posterPath: "https://c8.alamy.com/comp/GHCDDM/cars-usa-2006-john-lasseter-filmplakat-regie-john-lasseter-GHCDDM.jpg",
    ),
    MovieModel(
      id: 4,
      title: "Wonder Woman",
      overview: "This is the story of Wonder Woman who fights for justice and equality.",
      voteAverage: 8.7,
      posterPath: "https://wallpapers.com/images/hd/wonder-woman-pictures-uzthnjn2dvkjva7c.jpg",
    ),
  ];
}

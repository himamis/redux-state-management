import 'package:flutter/foundation.dart';

@immutable
class MoviesAppState {
  // The list of movies
  final List<Movie> movies;

  // The app is loading the list of movies
  final bool isLoading;

  const MoviesAppState(this.movies, this.isLoading);
}

@immutable
class Movie {
  final String title;
  final int releaseYear;

  const Movie(this.title, this.releaseYear);
}

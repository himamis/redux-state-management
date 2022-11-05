import 'package:redux_state_management/state.dart';

class StartLoading {
  // This action has no parameters
}

class MoviesLoaded {
  // The newly loaded list of movies
  final List<Movie> moviesLoaded;

  MoviesLoaded(this.moviesLoaded);
}

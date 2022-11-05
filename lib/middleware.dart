import 'package:redux/redux.dart';
import 'package:redux_state_management/actions.dart';
import 'package:redux_state_management/state.dart';

void loadMovies(Store<MoviesAppState> store) async {
  // Dispatch the loading action
  store.dispatch(StartLoading());

  // Actually load movies from the database
  final movies = await _loadMoviesFromDatabase();

  // Dispatch the movies loaded action
  store.dispatch(MoviesLoaded(movies));
}

Future<List<Movie>> _loadMoviesFromDatabase() async {
  // Here we simulate the loading of movies from a database.
  // In a real life scenario here you create an Http client
  // and process a get call
  return Future.delayed(
      const Duration(seconds: 2),
      () => [
            const Movie("Star Wars", 1977),
            const Movie("The Terminator", 1984),
            const Movie("The Green Mile", 1999),
            const Movie("The Matrix", 1999)
          ]);
}

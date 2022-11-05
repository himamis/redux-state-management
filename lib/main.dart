import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_state_management/actions.dart';
import 'package:redux_state_management/reducers.dart';
import 'package:redux_state_management/state.dart';

void main() {
  final store = Store<MoviesAppState>(
    // The reducer
    moviesAppStateReducer,
    // The initial state of the app
    initialState: MoviesAppState(),
  );
  runApp(
    StoreProvider<MoviesAppState>(
      store: store,
      child: const MoviesApp(),
    ),
  );
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Movies App',
      home: MoviesHomeScreen(),
    );
  }
}

class MoviesHomeScreen extends StatelessWidget {
  const MoviesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: StoreConnector<MoviesAppState, MoviesAppState>(
        builder: (_, state) => state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : state.movies.isEmpty
                ? loadMoviesButton(context)
                : moviesWidget(context),
        converter: (store) => store.state,
      ),
    ));
  }

  Widget moviesWidget(BuildContext context) {
    return Column(
      children: [
        numberOfMovies(context),
        Expanded(child: moviesList(context)),
      ],
    );
  }

  Widget loadMoviesButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text("Load movies"),
        onPressed: () async {
          final store = StoreProvider.of<MoviesAppState>(context);
          // Dispatch the loading action
          store.dispatch(StartLoading());

          // Here we simulate the loading of movies from a database.
          // In a real life scenario here you create an Http client
          // and process a get call
          final movies = await Future.delayed(
              const Duration(seconds: 2),
              () => [
                    Movie((b) => b
                      ..title = "Star Wars"
                      ..releaseYear = 1977),
                    Movie((b) => b
                      ..title = "The Terminator"
                      ..releaseYear = 1984),
                    Movie((b) => b
                      ..title = "The Green Mile"
                      ..releaseYear = 1999),
                    Movie((b) => b
                      ..title = "The Matrix"
                      ..releaseYear = 1999)
                  ]);

          // Dispatch the movies loaded action
          store.dispatch(MoviesLoaded(movies));
        },
      ),
    );
  }

  Widget numberOfMovies(BuildContext context) {
    return StoreConnector<MoviesAppState, int>(
      // The builder is called every time the state changes
      builder: (_, count) => Text("Number of movies $count"),
      // Converts the state to the data that we want to display
      converter: (store) => store.state.movies.length,
    );
  }

  Widget moviesList(BuildContext context) {
    return StoreConnector<MoviesAppState, List<Movie>>(
      builder: (_, movies) => ListView.builder(
        itemCount: movies.length,
        itemBuilder: (_, index) => Text(
          "Title ${movies[index].title}. Year ${movies[index].releaseYear}",
        ),
      ),
      converter: (store) => store.state.movies.toList(),
    );
  }
}

import 'package:redux_state_management/actions.dart';
import 'package:redux_state_management/state.dart';

MoviesAppState moviesAppStateReducer(MoviesAppState state, dynamic action) {
  if (action is StartLoading) {
    // Notice that we return a new instance of MoviesAppState
    // and don't modify the state 'in-place'.
    return MoviesAppState(
      // We return the old list of movies
      state.movies,
      // We change the isLoading parameter to true, because we started loading
      true,
    );
  } else if (action is MoviesLoaded) {
    return MoviesAppState(
      // We change the list of movies to the ones that were loaded
      action.moviesLoaded,
      // We chanage the isLoading parameter to false, because we finished loading
      false,
    );
  }
  return state;
}

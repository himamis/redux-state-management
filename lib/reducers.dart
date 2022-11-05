import 'package:redux_state_management/actions.dart';
import 'package:redux_state_management/state.dart';

MoviesAppState moviesAppStateReducer(MoviesAppState state, dynamic action) {
  if (action is StartLoading) {
    // Notice how we can simply rebuild the object without needing to
    // specify the arguments that do not change
    return state.rebuild((b) => b..isLoading = true);
  } else if (action is MoviesLoaded) {
    return state.rebuild(
      (b) => b
        ..isLoading = false
        ..movies.replace(action.moviesLoaded),
    );
  }
  return state;
}

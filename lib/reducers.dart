import 'package:redux/redux.dart';
import 'package:redux_state_management/actions.dart';
import 'package:redux_state_management/state.dart';

MoviesAppState _startLoadingReducer(MoviesAppState state, StartLoading action) {
  return state.rebuild((b) => b.isLoading = true);
}

MoviesAppState _moviesLoadedReducer(MoviesAppState state, MoviesLoaded action) {
  return state.rebuild(
    (b) => b
      ..isLoading = false
      ..movies.replace(action.moviesLoaded),
  );
}

final moviesAppStateReducer = combineReducers<MoviesAppState>([
  TypedReducer(_startLoadingReducer),
  TypedReducer(_moviesLoadedReducer),
]);

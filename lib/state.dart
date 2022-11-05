import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'state.g.dart';

abstract class MoviesAppState implements Built<MoviesAppState, MoviesAppStateBuilder> {
  @BuiltValueHook(initializeBuilder: true)
  static void _setDefaults(MoviesAppStateBuilder b) => b..isLoading = false;

  BuiltList<Movie> get movies;

  bool get isLoading;

  MoviesAppState._();

  factory MoviesAppState([void Function(MoviesAppStateBuilder) updates]) = _$MoviesAppState;
}

abstract class Movie implements Built<Movie, MovieBuilder> {
  String get title;

  int get releaseYear;

  Movie._();

  factory Movie([void Function(MovieBuilder) updates]) = _$Movie;
}

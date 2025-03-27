// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'similar_movies_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SimilarMoviesState {
  MoviesStateStatus get status;
  List<MovieItemEntity> get movies;

  /// Create a copy of SimilarMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SimilarMoviesStateCopyWith<SimilarMoviesState> get copyWith =>
      _$SimilarMoviesStateCopyWithImpl<SimilarMoviesState>(
          this as SimilarMoviesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SimilarMoviesState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.movies, movies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(movies));

  @override
  String toString() {
    return 'SimilarMoviesState(status: $status, movies: $movies)';
  }
}

/// @nodoc
abstract mixin class $SimilarMoviesStateCopyWith<$Res> {
  factory $SimilarMoviesStateCopyWith(
          SimilarMoviesState value, $Res Function(SimilarMoviesState) _then) =
      _$SimilarMoviesStateCopyWithImpl;
  @useResult
  $Res call({MoviesStateStatus status, List<MovieItemEntity> movies});
}

/// @nodoc
class _$SimilarMoviesStateCopyWithImpl<$Res>
    implements $SimilarMoviesStateCopyWith<$Res> {
  _$SimilarMoviesStateCopyWithImpl(this._self, this._then);

  final SimilarMoviesState _self;
  final $Res Function(SimilarMoviesState) _then;

  /// Create a copy of SimilarMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? movies = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MoviesStateStatus,
      movies: null == movies
          ? _self.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieItemEntity>,
    ));
  }
}

/// @nodoc

class _SimilarMoviesState extends SimilarMoviesState {
  const _SimilarMoviesState(
      [this.status = MoviesStateStatus.init,
      final List<MovieItemEntity> movies = const []])
      : _movies = movies,
        super._();

  @override
  @JsonKey()
  final MoviesStateStatus status;
  final List<MovieItemEntity> _movies;
  @override
  @JsonKey()
  List<MovieItemEntity> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  /// Create a copy of SimilarMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SimilarMoviesStateCopyWith<_SimilarMoviesState> get copyWith =>
      __$SimilarMoviesStateCopyWithImpl<_SimilarMoviesState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SimilarMoviesState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._movies, _movies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_movies));

  @override
  String toString() {
    return 'SimilarMoviesState(status: $status, movies: $movies)';
  }
}

/// @nodoc
abstract mixin class _$SimilarMoviesStateCopyWith<$Res>
    implements $SimilarMoviesStateCopyWith<$Res> {
  factory _$SimilarMoviesStateCopyWith(
          _SimilarMoviesState value, $Res Function(_SimilarMoviesState) _then) =
      __$SimilarMoviesStateCopyWithImpl;
  @override
  @useResult
  $Res call({MoviesStateStatus status, List<MovieItemEntity> movies});
}

/// @nodoc
class __$SimilarMoviesStateCopyWithImpl<$Res>
    implements _$SimilarMoviesStateCopyWith<$Res> {
  __$SimilarMoviesStateCopyWithImpl(this._self, this._then);

  final _SimilarMoviesState _self;
  final $Res Function(_SimilarMoviesState) _then;

  /// Create a copy of SimilarMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? movies = null,
  }) {
    return _then(_SimilarMoviesState(
      null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MoviesStateStatus,
      null == movies
          ? _self._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieItemEntity>,
    ));
  }
}

// dart format on

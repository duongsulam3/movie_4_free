// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_by_category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MoviesByCategoryState {
  MoviesStateStatus get status;
  List<NguoncMoviesByCategoryItemEntity> get movies;

  /// Create a copy of MoviesByCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MoviesByCategoryStateCopyWith<MoviesByCategoryState> get copyWith =>
      _$MoviesByCategoryStateCopyWithImpl<MoviesByCategoryState>(
          this as MoviesByCategoryState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MoviesByCategoryState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.movies, movies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(movies));

  @override
  String toString() {
    return 'MoviesByCategoryState(status: $status, movies: $movies)';
  }
}

/// @nodoc
abstract mixin class $MoviesByCategoryStateCopyWith<$Res> {
  factory $MoviesByCategoryStateCopyWith(MoviesByCategoryState value,
          $Res Function(MoviesByCategoryState) _then) =
      _$MoviesByCategoryStateCopyWithImpl;
  @useResult
  $Res call(
      {MoviesStateStatus status,
      List<NguoncMoviesByCategoryItemEntity> movies});
}

/// @nodoc
class _$MoviesByCategoryStateCopyWithImpl<$Res>
    implements $MoviesByCategoryStateCopyWith<$Res> {
  _$MoviesByCategoryStateCopyWithImpl(this._self, this._then);

  final MoviesByCategoryState _self;
  final $Res Function(MoviesByCategoryState) _then;

  /// Create a copy of MoviesByCategoryState
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
              as List<NguoncMoviesByCategoryItemEntity>,
    ));
  }
}

/// Adds pattern-matching-related methods to [MoviesByCategoryState].
extension MoviesByCategoryStatePatterns on MoviesByCategoryState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MoviesByCategoryState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MoviesByCategoryState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MoviesByCategoryState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MoviesByCategoryState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MoviesByCategoryState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MoviesByCategoryState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(MoviesStateStatus status,
            List<NguoncMoviesByCategoryItemEntity> movies)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MoviesByCategoryState() when $default != null:
        return $default(_that.status, _that.movies);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(MoviesStateStatus status,
            List<NguoncMoviesByCategoryItemEntity> movies)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MoviesByCategoryState():
        return $default(_that.status, _that.movies);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(MoviesStateStatus status,
            List<NguoncMoviesByCategoryItemEntity> movies)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MoviesByCategoryState() when $default != null:
        return $default(_that.status, _that.movies);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MoviesByCategoryState extends MoviesByCategoryState {
  const _MoviesByCategoryState(
      [this.status = MoviesStateStatus.init,
      final List<NguoncMoviesByCategoryItemEntity> movies = const []])
      : _movies = movies,
        super._();

  @override
  @JsonKey()
  final MoviesStateStatus status;
  final List<NguoncMoviesByCategoryItemEntity> _movies;
  @override
  @JsonKey()
  List<NguoncMoviesByCategoryItemEntity> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  /// Create a copy of MoviesByCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MoviesByCategoryStateCopyWith<_MoviesByCategoryState> get copyWith =>
      __$MoviesByCategoryStateCopyWithImpl<_MoviesByCategoryState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MoviesByCategoryState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._movies, _movies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_movies));

  @override
  String toString() {
    return 'MoviesByCategoryState(status: $status, movies: $movies)';
  }
}

/// @nodoc
abstract mixin class _$MoviesByCategoryStateCopyWith<$Res>
    implements $MoviesByCategoryStateCopyWith<$Res> {
  factory _$MoviesByCategoryStateCopyWith(_MoviesByCategoryState value,
          $Res Function(_MoviesByCategoryState) _then) =
      __$MoviesByCategoryStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {MoviesStateStatus status,
      List<NguoncMoviesByCategoryItemEntity> movies});
}

/// @nodoc
class __$MoviesByCategoryStateCopyWithImpl<$Res>
    implements _$MoviesByCategoryStateCopyWith<$Res> {
  __$MoviesByCategoryStateCopyWithImpl(this._self, this._then);

  final _MoviesByCategoryState _self;
  final $Res Function(_MoviesByCategoryState) _then;

  /// Create a copy of MoviesByCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? movies = null,
  }) {
    return _then(_MoviesByCategoryState(
      null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MoviesStateStatus,
      null == movies
          ? _self._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<NguoncMoviesByCategoryItemEntity>,
    ));
  }
}

// dart format on

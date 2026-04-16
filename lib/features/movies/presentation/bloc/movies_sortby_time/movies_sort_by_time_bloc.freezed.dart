// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_sort_by_time_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MoviesSortByTimeState {
  MoviesSortByTimeStateStatus get status;
  List<MovieItemEntity> get movies;

  /// Create a copy of MoviesSortByTimeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MoviesSortByTimeStateCopyWith<MoviesSortByTimeState> get copyWith =>
      _$MoviesSortByTimeStateCopyWithImpl<MoviesSortByTimeState>(
          this as MoviesSortByTimeState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MoviesSortByTimeState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.movies, movies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(movies));

  @override
  String toString() {
    return 'MoviesSortByTimeState(status: $status, movies: $movies)';
  }
}

/// @nodoc
abstract mixin class $MoviesSortByTimeStateCopyWith<$Res> {
  factory $MoviesSortByTimeStateCopyWith(MoviesSortByTimeState value,
          $Res Function(MoviesSortByTimeState) _then) =
      _$MoviesSortByTimeStateCopyWithImpl;
  @useResult
  $Res call({MoviesSortByTimeStateStatus status, List<MovieItemEntity> movies});
}

/// @nodoc
class _$MoviesSortByTimeStateCopyWithImpl<$Res>
    implements $MoviesSortByTimeStateCopyWith<$Res> {
  _$MoviesSortByTimeStateCopyWithImpl(this._self, this._then);

  final MoviesSortByTimeState _self;
  final $Res Function(MoviesSortByTimeState) _then;

  /// Create a copy of MoviesSortByTimeState
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
              as MoviesSortByTimeStateStatus,
      movies: null == movies
          ? _self.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieItemEntity>,
    ));
  }
}

/// Adds pattern-matching-related methods to [MoviesSortByTimeState].
extension MoviesSortByTimeStatePatterns on MoviesSortByTimeState {
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
    TResult Function(_MoviesSortByTimeState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MoviesSortByTimeState() when $default != null:
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
    TResult Function(_MoviesSortByTimeState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MoviesSortByTimeState():
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
    TResult? Function(_MoviesSortByTimeState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MoviesSortByTimeState() when $default != null:
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
    TResult Function(
            MoviesSortByTimeStateStatus status, List<MovieItemEntity> movies)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MoviesSortByTimeState() when $default != null:
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
    TResult Function(
            MoviesSortByTimeStateStatus status, List<MovieItemEntity> movies)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MoviesSortByTimeState():
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
    TResult? Function(
            MoviesSortByTimeStateStatus status, List<MovieItemEntity> movies)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MoviesSortByTimeState() when $default != null:
        return $default(_that.status, _that.movies);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MoviesSortByTimeState extends MoviesSortByTimeState {
  const _MoviesSortByTimeState(
      [this.status = MoviesSortByTimeStateStatus.init,
      final List<MovieItemEntity> movies = const []])
      : _movies = movies,
        super._();

  @override
  @JsonKey()
  final MoviesSortByTimeStateStatus status;
  final List<MovieItemEntity> _movies;
  @override
  @JsonKey()
  List<MovieItemEntity> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  /// Create a copy of MoviesSortByTimeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MoviesSortByTimeStateCopyWith<_MoviesSortByTimeState> get copyWith =>
      __$MoviesSortByTimeStateCopyWithImpl<_MoviesSortByTimeState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MoviesSortByTimeState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._movies, _movies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_movies));

  @override
  String toString() {
    return 'MoviesSortByTimeState(status: $status, movies: $movies)';
  }
}

/// @nodoc
abstract mixin class _$MoviesSortByTimeStateCopyWith<$Res>
    implements $MoviesSortByTimeStateCopyWith<$Res> {
  factory _$MoviesSortByTimeStateCopyWith(_MoviesSortByTimeState value,
          $Res Function(_MoviesSortByTimeState) _then) =
      __$MoviesSortByTimeStateCopyWithImpl;
  @override
  @useResult
  $Res call({MoviesSortByTimeStateStatus status, List<MovieItemEntity> movies});
}

/// @nodoc
class __$MoviesSortByTimeStateCopyWithImpl<$Res>
    implements _$MoviesSortByTimeStateCopyWith<$Res> {
  __$MoviesSortByTimeStateCopyWithImpl(this._self, this._then);

  final _MoviesSortByTimeState _self;
  final $Res Function(_MoviesSortByTimeState) _then;

  /// Create a copy of MoviesSortByTimeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? movies = null,
  }) {
    return _then(_MoviesSortByTimeState(
      null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MoviesSortByTimeStateStatus,
      null == movies
          ? _self._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieItemEntity>,
    ));
  }
}

// dart format on

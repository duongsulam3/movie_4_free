// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recently_update_movies_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecentlyUpdateMoviesState {
  MoviesStateStatus get status;
  int get page;
  List<RecentlyUpdateListItemEntity> get movies;

  /// Create a copy of RecentlyUpdateMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecentlyUpdateMoviesStateCopyWith<RecentlyUpdateMoviesState> get copyWith =>
      _$RecentlyUpdateMoviesStateCopyWithImpl<RecentlyUpdateMoviesState>(
          this as RecentlyUpdateMoviesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecentlyUpdateMoviesState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other.movies, movies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, page, const DeepCollectionEquality().hash(movies));

  @override
  String toString() {
    return 'RecentlyUpdateMoviesState(status: $status, page: $page, movies: $movies)';
  }
}

/// @nodoc
abstract mixin class $RecentlyUpdateMoviesStateCopyWith<$Res> {
  factory $RecentlyUpdateMoviesStateCopyWith(RecentlyUpdateMoviesState value,
          $Res Function(RecentlyUpdateMoviesState) _then) =
      _$RecentlyUpdateMoviesStateCopyWithImpl;
  @useResult
  $Res call(
      {MoviesStateStatus status,
      int page,
      List<RecentlyUpdateListItemEntity> movies});
}

/// @nodoc
class _$RecentlyUpdateMoviesStateCopyWithImpl<$Res>
    implements $RecentlyUpdateMoviesStateCopyWith<$Res> {
  _$RecentlyUpdateMoviesStateCopyWithImpl(this._self, this._then);

  final RecentlyUpdateMoviesState _self;
  final $Res Function(RecentlyUpdateMoviesState) _then;

  /// Create a copy of RecentlyUpdateMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? page = null,
    Object? movies = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MoviesStateStatus,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      movies: null == movies
          ? _self.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<RecentlyUpdateListItemEntity>,
    ));
  }
}

/// Adds pattern-matching-related methods to [RecentlyUpdateMoviesState].
extension RecentlyUpdateMoviesStatePatterns on RecentlyUpdateMoviesState {
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
    TResult Function(_RecentlyUpdateMoviesState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RecentlyUpdateMoviesState() when $default != null:
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
    TResult Function(_RecentlyUpdateMoviesState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentlyUpdateMoviesState():
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
    TResult? Function(_RecentlyUpdateMoviesState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentlyUpdateMoviesState() when $default != null:
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
    TResult Function(MoviesStateStatus status, int page,
            List<RecentlyUpdateListItemEntity> movies)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RecentlyUpdateMoviesState() when $default != null:
        return $default(_that.status, _that.page, _that.movies);
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
    TResult Function(MoviesStateStatus status, int page,
            List<RecentlyUpdateListItemEntity> movies)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentlyUpdateMoviesState():
        return $default(_that.status, _that.page, _that.movies);
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
    TResult? Function(MoviesStateStatus status, int page,
            List<RecentlyUpdateListItemEntity> movies)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentlyUpdateMoviesState() when $default != null:
        return $default(_that.status, _that.page, _that.movies);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RecentlyUpdateMoviesState extends RecentlyUpdateMoviesState {
  const _RecentlyUpdateMoviesState(
      [this.status = MoviesStateStatus.init,
      this.page = 1,
      final List<RecentlyUpdateListItemEntity> movies = const []])
      : _movies = movies,
        super._();

  @override
  @JsonKey()
  final MoviesStateStatus status;
  @override
  @JsonKey()
  final int page;
  final List<RecentlyUpdateListItemEntity> _movies;
  @override
  @JsonKey()
  List<RecentlyUpdateListItemEntity> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  /// Create a copy of RecentlyUpdateMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecentlyUpdateMoviesStateCopyWith<_RecentlyUpdateMoviesState>
      get copyWith =>
          __$RecentlyUpdateMoviesStateCopyWithImpl<_RecentlyUpdateMoviesState>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecentlyUpdateMoviesState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._movies, _movies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, page, const DeepCollectionEquality().hash(_movies));

  @override
  String toString() {
    return 'RecentlyUpdateMoviesState(status: $status, page: $page, movies: $movies)';
  }
}

/// @nodoc
abstract mixin class _$RecentlyUpdateMoviesStateCopyWith<$Res>
    implements $RecentlyUpdateMoviesStateCopyWith<$Res> {
  factory _$RecentlyUpdateMoviesStateCopyWith(_RecentlyUpdateMoviesState value,
          $Res Function(_RecentlyUpdateMoviesState) _then) =
      __$RecentlyUpdateMoviesStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {MoviesStateStatus status,
      int page,
      List<RecentlyUpdateListItemEntity> movies});
}

/// @nodoc
class __$RecentlyUpdateMoviesStateCopyWithImpl<$Res>
    implements _$RecentlyUpdateMoviesStateCopyWith<$Res> {
  __$RecentlyUpdateMoviesStateCopyWithImpl(this._self, this._then);

  final _RecentlyUpdateMoviesState _self;
  final $Res Function(_RecentlyUpdateMoviesState) _then;

  /// Create a copy of RecentlyUpdateMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? page = null,
    Object? movies = null,
  }) {
    return _then(_RecentlyUpdateMoviesState(
      null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MoviesStateStatus,
      null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      null == movies
          ? _self._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<RecentlyUpdateListItemEntity>,
    ));
  }
}

// dart format on
